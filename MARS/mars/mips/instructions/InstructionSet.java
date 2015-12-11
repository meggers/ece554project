package mars.mips.instructions;
import mars.simulator.*;
import mars.mips.hardware.*;
import mars.mips.instructions.syscalls.*;
import mars.*;
import mars.util.*;
import java.util.*;
import java.io.*;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;


/*
Copyright (c) 2003-2013,  Pete Sanderson and Kenneth Vollmar

Developed by Pete Sanderson (psanderson@otterbein.edu)
and Kenneth Vollmar (kenvollmar@missouristate.edu)

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject 
to the following conditions:

The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(MIT license, http://www.opensource.org/licenses/mit-license.html)
 */

/**
 * The list of Instruction objects, each of which represents a MIPS instruction.
 * The instruction may either be basic (translates into binary machine code) or
 * extended (translates into sequence of one or more basic instructions).
 *
 * @author Pete Sanderson and Ken Vollmar
 * @version August 2003-5
 */

public class InstructionSet
{
	private ArrayList instructionList;
	private ArrayList opcodeMatchMaps;
	private SyscallLoader syscallLoader;

	int[] backgroundTile = new int[1024];
	int[] backgroundAttribute = new int[1024];

	HashMap<String, Integer> spriteAssemblerHash; // will be handled by the assembler
	BufferedImage[] spritePatternTable = new BufferedImage[256]; // index into sprite visual data, use assembler for index
	BufferedImage[] backgroundPatternTable = new BufferedImage[256]; // index into background visual data, use assembler for index
	int DISPLAY_LOGIC_WIDTH = 256;
	int DISPLAY_LOGIC_HEIGHT = 256;
	int DISPLAY_LOGIC_IMAGE_DIMENSION = 8;
	int DISPLAY_LOGIC_UNIT_SIZE = 4;
	BufferedImage[][] groundVisual = new BufferedImage[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION];
	SpriteData[] spriteData = new SpriteData[64];
	int[] clonedStatusRegisters = new int[3];
	int[][] groundData = new int[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE];
	// commented out, use backgroundPatternTable for TronMIPSter; BufferedImage[][][][] background = new BufferedImage[4][4][4][4];

	int p1x;
	int p1y;
	int p2x;
	int p2y;

	char[] directions = {'d', 'j'};
	char[] nextDirections = {'d', 'j'};

	class SpriteData {
		BufferedImage bufferedImage;
		int yPosition;
		int xPosition;
		int colorPaletteIndex;
		boolean isFlipHorizontal;
		boolean isFlipVertical;

		public SpriteData(BufferedImage bufferedImage, int yPosition, int xPosition, int colorPaletteIndex, boolean isFlipHorizontal, boolean isFlipVertical) {
			this.bufferedImage = bufferedImage;
			this.yPosition = yPosition;
			this.xPosition = xPosition;
			this.colorPaletteIndex = colorPaletteIndex;
			this.isFlipHorizontal = isFlipHorizontal;
			this.isFlipVertical = isFlipVertical;
		}

		public void remove() {
			bufferedImage = spritePatternTable[255]; 
			yPosition = 255;
			xPosition = 255;
			colorPaletteIndex = 3;
			isFlipHorizontal = true;
			isFlipVertical = true;
		}

		public BufferedImage getBufferedImage() {
			return bufferedImage;
		}

		public void setBufferedImage(BufferedImage bufferedImage) {
			this.bufferedImage = bufferedImage;
		}

		public int getyPosition() {
			return yPosition;
		}

		public void setyPosition(int yPosition) {
			this.yPosition = yPosition;
		}

		public int getxPosition() {
			return xPosition;
		}

		public void setxPosition(int xPosition) {
			this.xPosition = xPosition;
		}

		public int getColorPaletteIndex() {
			return colorPaletteIndex;
		}

		public void setColorPaletteIndex(int colorPaletteIndex) {
			this.colorPaletteIndex = colorPaletteIndex;
		}

		public boolean isFlipHorizontal() {
			return isFlipHorizontal;
		}

		public void setFlipHorizontal(boolean isFlipHorizontal) {
			this.isFlipHorizontal = isFlipHorizontal;
		}

		public boolean isFlipVertical() {
			return isFlipVertical;
		}

		public void setFlipVertical(boolean isFlipVertical) {
			this.isFlipVertical = isFlipVertical;
		}
	}

	class PPUSimulator implements Runnable {
		public void run() {
			readBackground();
			//System.out.println("done reading background");
			try {
				start();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void readBackground() {
		spriteAssemblerHash = new HashMap<String, Integer>();
		try {
			File imageFile;
			BufferedImage bufferedImage;
			int[] imageData = new int[DISPLAY_LOGIC_IMAGE_DIMENSION * DISPLAY_LOGIC_IMAGE_DIMENSION];
			BufferedReader br = new BufferedReader(new FileReader("sprite-definitions.csv"));
			for (String line; (line = br.readLine()) != null; ) {
				// process the line
				String[] lineTokens = line.split(",");
				//for (int i = 0; i < lineTokens.length; ++i) {
				//	System.out.println("lineTokens[" + i + "] = $" + lineTokens[i] + "$");
				//}
				try {
					spriteAssemblerHash.put(lineTokens[0] + "_index", Integer.parseInt(lineTokens[1]));
					spriteAssemblerHash.put(lineTokens[0] + "_height", Integer.parseInt(lineTokens[2]));
					spriteAssemblerHash.put(lineTokens[0] + "_width", Integer.parseInt(lineTokens[3]));
					imageFile = new File("images/foreground/" + lineTokens[0] + ".png");
					if (imageFile.exists()) {
						// System.out.println(lineTokens[0] + " is sprite");
						bufferedImage = ImageIO.read(imageFile);
						for (int height = 0; height < bufferedImage.getHeight() / DISPLAY_LOGIC_IMAGE_DIMENSION; ++height) {
							for (int width = 0; width < bufferedImage.getWidth() / DISPLAY_LOGIC_IMAGE_DIMENSION; ++width) {
								bufferedImage.getRGB(width * DISPLAY_LOGIC_IMAGE_DIMENSION, height * DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, imageData, 0, DISPLAY_LOGIC_IMAGE_DIMENSION);
								BufferedImage bufferedImageOutput = new BufferedImage(DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, BufferedImage.TYPE_INT_RGB);
								bufferedImageOutput.setRGB(0, 0, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, imageData, 0, 8);
								// ImageIO.write(bufferedImageOutput, "png", new File("test_test_foreground" + foregroundCount + ".png"));
								spritePatternTable[Integer.parseInt(lineTokens[1]) + height*(bufferedImage.getWidth()/DISPLAY_LOGIC_IMAGE_DIMENSION) + width] = bufferedImageOutput;
							}
						}
					}
					imageFile = new File("images/background/" + lineTokens[0] + ".png");
					if (imageFile.exists()) {
						// System.out.println(lineTokens[0] + " is background");
						bufferedImage = ImageIO.read(imageFile);
						for (int height = 0; height < bufferedImage.getHeight() / DISPLAY_LOGIC_IMAGE_DIMENSION; ++height) {
							for (int width = 0; width < bufferedImage.getWidth() / DISPLAY_LOGIC_IMAGE_DIMENSION; ++width) {
								bufferedImage.getRGB(width * DISPLAY_LOGIC_IMAGE_DIMENSION, height * DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, imageData, 0, DISPLAY_LOGIC_IMAGE_DIMENSION);
								BufferedImage bufferedImageOutput = new BufferedImage(DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, BufferedImage.TYPE_INT_RGB);
								bufferedImageOutput.setRGB(0, 0, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, imageData, 0, 8);
								// ImageIO.write(bufferedImageOutput, "png", new File("test_test_background" + backgroundCount + lineTokens[0] + ".png"));
								backgroundPatternTable[Integer.parseInt(lineTokens[1]) + height*(bufferedImage.getWidth()/DISPLAY_LOGIC_IMAGE_DIMENSION) + width] = bufferedImageOutput;
							}
						}
					}
				} catch (Exception e) {
				}
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void start() throws IOException {
		JFrame jFrame = new JFrame("PPU Simulator");
		jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		groundVisual = new BufferedImage[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE];
		groundData = new int[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE];

		p1x = DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE / 5;		// give three fifth of screen of bikes to run into each other
		p2x = DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE * 4 / 5;

		p1y = DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE / 2;		// initialize both bikes to vertical half
		p2y = DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE / 2;

		directions[0] = 'd';
		directions[1] = 'j';
		nextDirections[0] = 'd';
		nextDirections[1] = 'j';

		// OAM
		for (int OAMindex = 0; OAMindex < 64; ++OAMindex) {
			spriteData[OAMindex] = new SpriteData(spritePatternTable[255], 255, 255, 3, true, true);
		}

		// all
		for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++x) {
			for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++y) {
				groundData[x][y] = 0;
			}
		}
		for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++x) {
			for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++y) {
				// commented out, do this with TronMIPStor ISA instead; groundVisual[x][y] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0000_index")], 0);
			}
		}

		// top
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][0] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			// commented out, do this with TronMIPStor ISA instead; groundVisual[i][0] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3300_index")], 0);
		}

		// left
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[0][i] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			// commented out, do this with TronMIPStor ISA instead; groundVisual[0][i] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3030_index")], 0);
		}

		// right
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE - 1][i] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			// commented out, do this with TronMIPStor ISA instead; groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][i] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0303_index")], 0);
		}

		// bottom
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE - 1] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			// commented out, do this with TronMIPStor ISA instead; groundVisual[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0033_index")], 0);
		}

		// need to recover the corners since images overwrite each other
		// commented out, do this with TronMIPStor ISA instead; 
		// groundVisual[0][0] = ImageIO.read(new File("images/background/background3330.png"));
		//groundVisual[0][0] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3330_index")], 0);
		// groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = ImageIO.read(new File("images/background/background3303.png"));
		//groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3303_index")], 0);
		// groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background3033.png"));
		//groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3033_index")], 0);
		// groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background0333.png"));
		//groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0333_index")], 0);

		PPU ppu = new PPU();
		jFrame.add(ppu);
		jFrame.setSize(DISPLAY_LOGIC_WIDTH + 50, DISPLAY_LOGIC_HEIGHT + 50);
		jFrame.setVisible(true);

		KeyListener keyListener = new KeyListener() {
			@Override
			public void keyPressed(KeyEvent arg0) {
				char characterPressed = arg0.getKeyChar();
				// key press interrupt, commented out, since Tronsmipster ISA has to do this instead
				System.out.println("key press interrupt has occured, key = " + characterPressed);
				int keyboardInterruptAddress = 4088 * 4;
				try { 
					// now PC = 4088 (or 4088 * 4 internally), so need to add b (branch) opcode plus jump up 4088 plus label address minus 1 (to cancel PC always incrementing)
					Globals.memory.setStatement(keyboardInterruptAddress, new ProgramStatement(0x0c000000 + ((-4088) << 6 >>> 6) + (Globals.keyboard_address / 4) - 1, keyboardInterruptAddress)); 
				} catch (Exception e) { e.printStackTrace(); }
				RegisterFile.updateRegister(28, characterPressed);
				RegisterFile.updateRegister(30, RegisterFile.getProgramCounter() / 4);
				clonedStatusRegisters[0] = Coprocessor0.getValue(16);
				clonedStatusRegisters[1] = Coprocessor0.getValue(17);
				clonedStatusRegisters[2] = Coprocessor0.getValue(18);
				processJump(keyboardInterruptAddress); // 0x3FD * 4 (since word addressing), then converted to decimal
			}

			@Override
			public void keyReleased(KeyEvent arg0) {
			}

			@Override
			public void keyTyped(KeyEvent e) {
			}
		};

		jFrame.addKeyListener(keyListener);

		try {
			// 0x3Fd * 4 (to change to word addressing), then convert to decimal
			Globals.memory.setStatement(4084, new ProgramStatement(0x19200000, 4084));
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		while(true) {
			Thread thread = new Thread(new TimerInterrupt());
			thread.start();
			try {
				thread.join();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}

			// game tick interrupt, commented out, since Tronsmipster ISA has to do this instead
			System.out.println("timer interrupt has occurred");
			int gameTickInterruptAddress = 4084 * 4;
			try { 
				//Globals.memory.setStatement(gameTickInterruptAddress, new ProgramStatement(0x0c000000 + ((Globals.game_tick_address - gameTickInterruptAddress) << 6 >>> 6), gameTickInterruptAddress)); 
				// now PC = 4084 (or 4084 * 4 internally), so need to add b (branch) opcode plus jump up 4084 plus label address minus 1 (to cancel PC always incrementing)
				Globals.memory.setStatement(gameTickInterruptAddress, new ProgramStatement(0x0c000000 + ((-4084) << 6 >>> 6) + (Globals.game_tick_address / 4) - 1, gameTickInterruptAddress)); 
				//System.out.println("(Globals.game_tick_address - gameTickInterruptAddress) = " + (Globals.game_tick_address - gameTickInterruptAddress));
				//System.out.println("((Globals.game_tick_address - gameTickInterruptAddress) << 6 >>> 6) = " + ((Globals.game_tick_address - gameTickInterruptAddress) << 6 >>> 6));
				//System.out.println(Globals.game_tick_address);
				//System.out.println(Globals.keyboard_address);
				//System.out.println(Globals.stack_ov_address);
				//System.out.println(Globals.memory.getStatement(gameTickInterruptAddress)); 
			} catch (Exception e) { e.printStackTrace(); }
			RegisterFile.updateRegister(30, RegisterFile.getProgramCounter() / 4);
			clonedStatusRegisters[0] = Coprocessor0.getValue(16);
			clonedStatusRegisters[1] = Coprocessor0.getValue(17);
			clonedStatusRegisters[2] = Coprocessor0.getValue(18);
			processJump(gameTickInterruptAddress); // 0x3FD * 4 (since word addressing), then converted to decimal
			
			/*
			// update direction
			switch (directions[0]) {
			case 'w': p1y--; break;
			case 'a': p1x--; break;
			case 's': p1y++; break;
			case 'd': p1x++; break;
			}
			switch (directions[1]) {
			case 'i': p2y--; break;
			case 'j': p2x--; break;
			case 'k': p2y++; break;
			case 'l': p2x++; break;
			}

			// check for collision
			if (groundData[p1x][p1y] != 0) {
				if (groundData[p2x][p2y] != 0) {
					System.out.println("tied");
				} else {
					System.out.println("player 2 wins");
				}
				jFrame.setVisible(false);
				return;
			} else {
				if (groundData[p2x][p2y] != 0) {
					System.out.println("player 1 wins");
					jFrame.setVisible(false);
					return;
				}
			}
			//			
			//			// update background to leave trail
			groundData[p1x][p1y] = 1;
			int p1xVisual = p1x / 2;
			int p1yVisual = p1y / 2;
			groundData[p2x][p2y] = 2;
			int p2xVisual = p2x / 2;
			int p2yVisual = p2y / 2;

			//			System.out.println("before = " + p1x + "; after = " + p1xVisual);
			//			System.out.println("pulling from background[groundData[" + p1xVisual + "][" + p1yVisual + "]][groundData[][]][groundData[][]][groundData[][]]");
			//			System.out.println("which equals to background[" + groundData[p1xVisual][p1yVisual] + "][" + groundData[p1xVisual + 1][p1yVisual] + "][" + groundData[p1xVisual][p1yVisual + 1] + "][" + groundData[p1xVisual + 1][p1yVisual + 1] + "]");

			//groundVisual[p1xVisual][p1yVisual] = background[groundData[2 * p1xVisual][2 * p1yVisual]][groundData[2 * p1xVisual + 1][2 * p1yVisual]][groundData[2 * p1xVisual][2 * p1yVisual + 1]][groundData[2 * p1xVisual + 1][2 * p1yVisual + 1]];
			int p1LocationVisual = getVisualIndex((groundData[2 * p1xVisual][2 * p1yVisual]) + 4*(groundData[2 * p1xVisual + 1][2 * p1yVisual]) + 16*(groundData[2 * p1xVisual][2 * p1yVisual + 1]) + 64*(groundData[2 * p1xVisual + 1][2 * p1yVisual + 1]));
			groundVisual[p1xVisual][p1yVisual] = setColorPalette(backgroundPatternTable[p1LocationVisual], 0);
			//groundVisual[p2xVisual][p2yVisual] = background[groundData[2 * p2xVisual][2 * p2yVisual]][groundData[2 * p2xVisual + 1][2 * p2yVisual]][groundData[2 * p2xVisual][2 * p2yVisual + 1]][groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]];
			int p2LocationVisual = getVisualIndex((groundData[2 * p2xVisual][2 * p2yVisual]) + 4*(groundData[2 * p2xVisual + 1][2 * p2yVisual]) + 16*(groundData[2 * p2xVisual][2 * p2yVisual + 1]) + 64*(groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]));
			groundVisual[p2xVisual][p2yVisual] = setColorPalette(backgroundPatternTable[p2LocationVisual], 0);

			directions[0] = nextDirections[0];
			directions[1] = nextDirections[1];
			 */

			jFrame.repaint();
		}
	}

	public class PPU extends JPanel {
		public void paintComponent(Graphics graphics) {
			super.paintComponent(graphics);
			this.setBackground(Color.WHITE);

			for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++x) {
				for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++y) {
					graphics.drawImage(groundVisual[x][y], x * DISPLAY_LOGIC_IMAGE_DIMENSION, y * DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				}
			}

			// draw light bikes
			for (int spriteIndex = 63; spriteIndex >= 0; --spriteIndex) {
				int sld = Coprocessor1.getValue(spriteIndex);
				int sslY = sld & 0x000000FF;
				if (sslY == 255) {
					continue;
				}
				int sfa = (sld & 0x0000FF00) >>> 8;
				int colorPaletteIndex = sfa & 0x00000003;
				boolean isFlipVertical = (sfa & 0x00000080) == 0x00000080;
				boolean isFlipHorizontal = (sfa & 0x00000040) == 0x0000004;
				int sft = (sld & 0x00FF0000) >>> 16;
				BufferedImage bufferedImage = spritePatternTable[sft];
				int sslX = (sld & 0xFF000000) >>> 24;

				graphics.drawImage(setColorPalette(setFlip(bufferedImage, isFlipVertical, isFlipHorizontal), colorPaletteIndex), sslX, sslY, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
			}
		}
	}

	public BufferedImage setFlip(BufferedImage inputBufferedImage, boolean isFlipVertical, boolean isFlipHorizontal) {

		if (inputBufferedImage == null) {
			return new BufferedImage(8, 8, BufferedImage.TYPE_INT_RGB);
		}
		
		BufferedImage outputBufferedImage = new BufferedImage(inputBufferedImage.getWidth(), inputBufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
		if (!isFlipHorizontal && !isFlipVertical) {
			return inputBufferedImage;
		} else if (!isFlipHorizontal && isFlipVertical) {
			for (int x = 0; x < inputBufferedImage.getWidth(); ++x) {
				for (int y = 0; y < inputBufferedImage.getHeight(); ++y) {
					outputBufferedImage.setRGB(x, y, inputBufferedImage.getRGB(x, inputBufferedImage.getHeight() - 1 - y));
				}
			}
		} else if (isFlipHorizontal && !isFlipVertical) {
			for (int x = 0; x < inputBufferedImage.getWidth(); ++x) {
				for (int y = 0; y < inputBufferedImage.getHeight(); ++y) {
					outputBufferedImage.setRGB(x, y, inputBufferedImage.getRGB(inputBufferedImage.getWidth() - 1 - x, y));
				}
			}
		} else {
			for (int x = 0; x < inputBufferedImage.getWidth(); ++x) {
				for (int y = 0; y < inputBufferedImage.getHeight(); ++y) {
					outputBufferedImage.setRGB(x, y, inputBufferedImage.getRGB(inputBufferedImage.getWidth() - 1 - x, inputBufferedImage.getHeight() - 1 - y));
				}
			}
		}
		return outputBufferedImage;
	}

	public BufferedImage setColorPalette(BufferedImage inputBufferedImage, int colorPaletteIndex) {

		if (inputBufferedImage == null) {
			return new BufferedImage(8, 8, BufferedImage.TYPE_INT_RGB);
		}
		
		// colorPaletteIndex0 = BlRGB
		// colorPaletteIndex1 = BlCMY
		// colorPaletteIndex2 = BlBRG
		// colorPaletteIndex3 = BlBBB

		int[] colors = { Color.PINK.getRGB(), Color.RED.getRGB(), Color.GREEN.getRGB(), Color.BLUE.getRGB() };
		//	^ is the global background color
		switch (colorPaletteIndex) {
		case 1: 
			colors[1] = Color.CYAN.getRGB();
			colors[2] = Color.MAGENTA.getRGB();
			colors[3] = Color.YELLOW.getRGB();
			break;
		case 2: 
			colors[1] = Color.GREEN.getRGB();
			colors[2] = Color.RED.getRGB();
			colors[3] = Color.BLUE.getRGB();
			break;
		case 3: 
			colors[1] = Color.BLUE.getRGB();
			colors[2] = Color.BLUE.getRGB();
			colors[3] = Color.BLUE.getRGB();
			break;
		}

		BufferedImage outputBufferedImage = new BufferedImage(inputBufferedImage.getWidth(), inputBufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < inputBufferedImage.getWidth(); ++x) {
			for (int y = 0; y < inputBufferedImage.getHeight(); ++y) {
				if (inputBufferedImage.getRGB(x, y) == Color.BLACK.getRGB()) {
					outputBufferedImage.setRGB(x, y, colors[0]);
				} else if (inputBufferedImage.getRGB(x, y) == Color.RED.getRGB()) {
					outputBufferedImage.setRGB(x, y, colors[1]);
				} else if (inputBufferedImage.getRGB(x, y) == Color.GREEN.getRGB()) {
					outputBufferedImage.setRGB(x, y, colors[2]);
				} else if (inputBufferedImage.getRGB(x, y) == Color.BLUE.getRGB()) {
					outputBufferedImage.setRGB(x, y, colors[3]);
				}
			}
		}
		return outputBufferedImage;
	}

	public void sleep(int milliseconds) {
		try {
			Thread.sleep(milliseconds);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	class TimerInterrupt implements Runnable {
		public void run() {
			try {
				Thread.sleep(10000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Creates a new InstructionSet object.
	 */
	public InstructionSet()
	{
		instructionList = new ArrayList();

	}
	/**
	 * Retrieve the current instruction set.
	 */
	public ArrayList getInstructionList()
	{
		return instructionList;

	}
	/**
	 * Adds all instructions to the set.  A given extended instruction may have
	 * more than one Instruction object, depending on how many formats it can have.
	 * @see Instruction
	 * @see BasicInstruction
	 * @see ExtendedInstruction
	 */
	public void populate()
	{
		Thread thread = new Thread(new PPUSimulator());	// read meridian data while waiting for user input
		thread.start();
		/* Here is where the parade begins.  Every instruction is added to the set here.*/

		// ////////////////////////////////////   BASIC INSTRUCTIONS START HERE ////////////////////////////////

		instructionList.add(
				new BasicInstruction("nop",
						"Null operation : do nothing",
						BasicInstructionFormat.R_FORMAT,
						"111111 00000000000000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						// Hey I like this so far!
					}
				}));

		instructionList.add(
				new BasicInstruction("add $t1,$t2,$t3",
						"Addition with overflow : set $t1 to ($t2 plus $t3)",
						BasicInstructionFormat.R_FORMAT,
						"100000 fffff sssss ttttt 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int add1 = RegisterFile.getValue(operands[1]);
						int add2 = RegisterFile.getValue(operands[2]);
						int sum = add1 + add2;
						// overflow on A+B detected when A and B have same sign and A+B has other sign.
						if ((add1 >= 0 && add2 >= 0 && sum < 0)
								|| (add1 < 0 && add2 < 0 && sum >= 0))
						{
							throw new ProcessingException(statement,
									"arithmetic overflow",Exceptions.ARITHMETIC_OVERFLOW_EXCEPTION);
						}
						Coprocessor0.updateRegister(16, (sum == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (sum < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], sum);
					}
				}));

		instructionList.add(
				new BasicInstruction("sub $t1,$t2,$t3",
						"Subtraction with overflow : set $t1 to ($t2 minus $t3)",
						BasicInstructionFormat.R_FORMAT,
						"100010 fffff sssss ttttt 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int sub1 = RegisterFile.getValue(operands[1]);
						int sub2 = RegisterFile.getValue(operands[2]);
						int dif = sub1 - sub2;
						// overflow on A-B detected when A and B have opposite signs and A-B has B's sign
						if ((sub1 >= 0 && sub2 < 0 && dif < 0)
								|| (sub1 < 0 && sub2 >= 0 && dif >= 0))
						{
							Coprocessor0.updateRegister(18, 1);
							throw new ProcessingException(statement,
									"arithmetic overflow",Exceptions.ARITHMETIC_OVERFLOW_EXCEPTION);
						} else {
							Coprocessor0.updateRegister(18, 0);
						}
						Coprocessor0.updateRegister(16, (dif == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (dif < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], dif);
					}
				}));


		instructionList.add(
				new BasicInstruction("addi $t1,$t2,-100",
						"Addition immediate with overflow : set $t1 to ($t2 plus signed 16-bit immediate)",
						BasicInstructionFormat.I_FORMAT,
						"100001 fffff sssss tttttttttttttttt",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int add1 = RegisterFile.getValue(operands[1]);
						int add2 = operands[2] << 16 >> 16;
						int sum = add1 + add2;
						// overflow on A+B detected when A and B have same sign and A+B has other sign.
						if ((add1 >= 0 && add2 >= 0 && sum < 0)
								|| (add1 < 0 && add2 < 0 && sum >= 0))
						{
							throw new ProcessingException(statement,
									"arithmetic overflow",Exceptions.ARITHMETIC_OVERFLOW_EXCEPTION);
						}
						Coprocessor0.updateRegister(16, (sum == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (sum < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], sum);
					}
				}));

		instructionList.add(
				new BasicInstruction("and $t1,$t2,$t3",
						"Bitwise AND : Set $t1 to bitwise AND of $t2 and $t3",
						BasicInstructionFormat.R_FORMAT,
						"100100 fffff sssss ttttt 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int and = RegisterFile.getValue(operands[1]) & RegisterFile.getValue(operands[2]);
						Coprocessor0.updateRegister(16, (and == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (and < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], and);
					}
				}));


		instructionList.add(
				new BasicInstruction("andi $t1,$t2,100",
						"Bitwise AND immediate : Set $t1 to bitwise AND of $t2 and sign-extended 16-bit immediate",
						BasicInstructionFormat.I_FORMAT,
						"100101 fffff sssss tttttttttttttttt",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int and = RegisterFile.getValue(operands[1]) & (operands[2] << 16 >> 16);
						// ANDing with 0x0000FFFF zero-extends the immediate (high 16 bits always 0).
						Coprocessor0.updateRegister(16, (and == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (and < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], and);
					}
				}));

		instructionList.add(
				new BasicInstruction("xor $t1,$t2,$t3",
						"Bitwise XOR (exclusive OR) : Set $t1 to bitwise XOR of $t2 and $t3",
						BasicInstructionFormat.R_FORMAT,
						"101000 fffff sssss ttttt 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int xor = RegisterFile.getValue(operands[1]) ^ RegisterFile.getValue(operands[2]);
						Coprocessor0.updateRegister(16, (xor == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (xor < 0 ? 1 : 0));
						Coprocessor0.updateRegister(18, 1);
						RegisterFile.updateRegister(operands[0], xor);
					}
				}));

		instructionList.add(
				new BasicInstruction("nand $t1,$t2,$t3",
						"Bitwise NAND: Set $t1 to bitwise NAND of $t2 and $t3",
						BasicInstructionFormat.R_FORMAT,
						"100011 fffff sssss ttttt 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int nand = ~(RegisterFile.getValue(operands[1]) & RegisterFile.getValue(operands[2]));
						Coprocessor0.updateRegister(16, (nand == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (nand < 0 ? 1 : 0));
						Coprocessor0.updateRegister(18, 1);
						RegisterFile.updateRegister(operands[0], nand);
					}
				}));

		instructionList.add(
				new BasicInstruction("sll $t1,$t2,10",
						"Shift left logical : Set $t1 to result of shifting $t2 left by number of bits specified by immediate",
						BasicInstructionFormat.R_FORMAT,
						"100111 fffff sssss 00000 ttttt 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int sll = RegisterFile.getValue(operands[1]) << operands[2];
						Coprocessor0.updateRegister(16, (sll == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (sll < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], sll);
					}
				}));

		instructionList.add(
				new BasicInstruction("srl $t1,$t2,10",
						"Shift right logical : Set $t1 to result of shifting $t2 right by number of bits specified by immediate",
						BasicInstructionFormat.R_FORMAT,
						"100110 fffff sssss 00000 ttttt 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						// must zero-fill, so use ">>>" instead of ">>".
						int srl = RegisterFile.getValue(operands[1]) >>> operands[2];
						Coprocessor0.updateRegister(16, (srl == 0 ? 1 : 0));
						Coprocessor0.updateRegister(17, (srl < 0 ? 1 : 0));
						RegisterFile.updateRegister(operands[0], srl);
					}
				}));
		instructionList.add(
				new BasicInstruction("li $t1,100",
						"Load Immediate : Set $t1 to immediate value 100",
						BasicInstructionFormat.I_FORMAT,
						"001001 fffff 00000 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						// RegisterFile.updateRegister(operands[0], operands[1]);
						// sign extending the li
						RegisterFile.updateRegister(operands[0], (operands[1] << 16 >> 16));
					}
				}));		
		instructionList.add(
				new BasicInstruction("li $t1,-100",
						"Load Immediate : Set $t1 to immediate sign extended value -100",
						BasicInstructionFormat.I_FORMAT,
						"001001 fffff 00000 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						// sign extending the li
						RegisterFile.updateRegister(operands[0], (operands[1] << 16 >> 16));
					}
				}));
		instructionList.add(
				new BasicInstruction("li $t1,label",
						"Load Immediate : Set $t1 to immediate sign extended address of label",
						BasicInstructionFormat.I_FORMAT,
						"001001 fffff 00000 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						// sign extending the li
						RegisterFile.updateRegister(operands[0], (operands[1] << 16 >> 16));
					}
				}));			
		instructionList.add(
				new BasicInstruction("lw $t1,-100($t2)",
						"Load word : Set $t1 to contents of effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"001000 fffff ttttt ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							RegisterFile.updateRegister(operands[0],
									Globals.memory.getWord(
											RegisterFile.getValue(operands[2]) + operands[1] * 4));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("lw $t1,$t2,-100",
						"Load word : Set $t1 to contents of effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"001000 fffff sssss tttttttttttttttt",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							RegisterFile.updateRegister(operands[0],
									Globals.memory.getWord(
											RegisterFile.getValue(operands[1]) + operands[2] * 4));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("lw $t1,$t2,label",
						"Load word : Set $t1 to contents of effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"001000 fffff sssss tttttttttttttttt",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							RegisterFile.updateRegister(operands[0],
									Globals.memory.getWord(
											RegisterFile.getValue(operands[1]) + operands[2] * 4));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("sw $t1,-100($t2)",
						"Store word : Store contents of $t1 into effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"001100 fffff ttttt ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							Globals.memory.setWord(
									(RegisterFile.getValue(operands[2]) + operands[1]) * 4,
									RegisterFile.getValue(operands[0]));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("sw $t1,$t2,-100",
						"Store word : Store contents of $t1 into effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"001100 fffff sssss tttttttttttttttt",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							Globals.memory.setWord(
									(RegisterFile.getValue(operands[1]) + operands[2]) * 4,
									RegisterFile.getValue(operands[0]));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("sw $t1,$t2,label",
						"Store word : Store contents of $t1 into effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"001100 fffff sssss tttttttttttttttt",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							Globals.memory.setWord(
									(RegisterFile.getValue(operands[1]) + operands[2]) * 4,
									RegisterFile.getValue(operands[0]));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("b label",
						"Branch unconditional : Branch to statement at label's address",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"000011 ffffffffffffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();

						//System.out.println("got branch instruction properly, going to " + (operands[0] << 6 >> 6));
						processBranch(operands[0] << 6 >> 6); // added sign extend
					}
				}));
		instructionList.add(
				new BasicInstruction("beq label",
						"Branch if equal : Branch to statement at label's address if $t1 and $t2 are equal",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"000000 ffffffffffffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();

						if (Coprocessor0.getValue(16) == 1)
						{
							processBranch(operands[0] << 6 >> 6);
						}
					}
				}));

		instructionList.add(
				new BasicInstruction("bne label",
						"Branch if not equal : Branch to statement at label's address if $t1 and $t2 are not equal",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"000001 ffffffffffffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (Coprocessor0.getValue(16) == 0)
						{
							processBranch(operands[0] << 6 >> 6);
						}
					}
				}));

		instructionList.add(
				new BasicInstruction("blt label",
						"Branch if less than: Branch to statement at label's address if $t1 is less $t2",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"000010 ffffffffffffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (Coprocessor0.getValue(17) == 1 && Coprocessor0.getValue(18) == 0)
						{
							processBranch(operands[0] << 6 >> 6);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("jr $t1",
						"Jump register : Unconditionally jump to address in $t1",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"000110 fffff 000000000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (operands[0] == 30) {
							Coprocessor0.updateRegister(16, clonedStatusRegisters[0]);
							Coprocessor0.updateRegister(17, clonedStatusRegisters[1]);
							Coprocessor0.updateRegister(17, clonedStatusRegisters[2]);
						}
						processJump(RegisterFile.getValue(operands[0]) << 2);
					}
				}));
		instructionList.add(
				new BasicInstruction("call label", 
						"Call a label : Update the PC and save the return address on the stack",
						BasicInstructionFormat.J_FORMAT,
						"000100 ffffffffffffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							Globals.memory.setWord(
									RegisterFile.getValue(29) * 4,
									RegisterFile.getProgramCounter() / 4); // dont have to +4 for push for some reason?
						}
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
						// Set the top of the stack with what's in the PC - 1 
						RegisterFile.updateRegister(29, RegisterFile.getValue(29) - 1);
						processJump(((RegisterFile.getProgramCounter() & 0xF0000000) | (operands[0] << 2)));  
					}
				}));
		instructionList.add(
				new BasicInstruction("ret", 
						"Return from a previous function call",
						BasicInstructionFormat.J_FORMAT,
						"000101 ffffffffffffffffffffffffff", // INTERNAL ERROR: mismatch in number of operands in statement vs mask otherwise
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						// int[] operands = statement.getOperands();

						RegisterFile.updateRegister(29, RegisterFile.getValue(29) + 1);
						try
						{
							processJump(Globals.memory.getWord(RegisterFile.getValue(29) * 4) * 4);
						}
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("push $t0",
						"Push a value from a register onto the stack",
						BasicInstructionFormat.I_FORMAT,
						"001110 fffff 000000000000000000000",

						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						try
						{
							Globals.memory.setWord(
									RegisterFile.getValue(29) * 4,			
									RegisterFile.getValue(operands[0]));		
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
						RegisterFile.updateRegister(29, RegisterFile.getValue(29) - 1);
					}

				}));
		instructionList.add(
				new BasicInstruction("pop $t0",
						"Pop a value from the stack into a register",
						BasicInstructionFormat.I_FORMAT,
						"001010 fffff 000000000000000000000",

						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();

						RegisterFile.updateRegister(29, RegisterFile.getValue(29) + 1);
						try
						{
							RegisterFile.updateRegister(operands[0], 
									Globals.memory.getWord(RegisterFile.getValue(29) * 4));		// what's in the PC
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}

				}));
		instructionList.add(        
				new BasicInstruction("srm $t0", 
						"Sprite Remove : Set Coprocessor register $t0[5:0] to 0xFFFFFFFF",
						BasicInstructionFormat.R_FORMAT,
						"010001 fffff 000000000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int OAMindex = RegisterFile.getValue(operands[0]) & 0x0000003F;
						Coprocessor1.updateRegister(OAMindex, 0xFFFFFFFF);
						//spriteData[OAMindex].remove();
					}
				}));
		instructionList.add(        
				new BasicInstruction("sld $t0, $t1", 
						"Sprite Load : Set Coprocessor register $t0[5:0] to $t1[31:0]",
						BasicInstructionFormat.R_FORMAT,
						"010011 fffff sssss 0000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int OAMindex = RegisterFile.getValue(operands[0]) & 0x0000003F;
						int sld = RegisterFile.getValue(operands[1]);
						Coprocessor1.updateRegister(OAMindex, sld);
						//int sslY = sld & 0x000000FF;
						//int sfa = (sld & 0x0000FF00) >>> 8;
						//int sft = (sld & 0x00FF0000) >>> 16;
						//int sslX = (sld & 0xFF000000) >>> 24;
						//spriteData[OAMindex].setyPosition(sslY);
						//spriteData[OAMindex].setColorPaletteIndex(sfa & 0x00000003);
						//spriteData[OAMindex].setFlipVertical((sfa & 0x00000080) == 0x00000080);
						//spriteData[OAMindex].setFlipHorizontal((sfa & 0x00000040) == 0x00000040);
						//spriteData[OAMindex].setBufferedImage(spritePatternTable[sft]);
						//spriteData[OAMindex].setxPosition(sslX);
					}
				}));
		instructionList.add(        
				new BasicInstruction("ssl $t0, $t1", 
						"Sprite Set Location : Set Coprocessor register $t0[5:0][31:24] to $t1[7:0] and Set Coprocessor register $t0[7:0] to $t2[7:0]",
						BasicInstructionFormat.R_FORMAT,
						"010010 fffff sssss 0000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int OAMindex = RegisterFile.getValue(operands[0]) & 0x0000003F;
						int sslY = RegisterFile.getValue(operands[1]) & 0x000000FF;
						int sslX = (RegisterFile.getValue(operands[1]) & 0x0000FF00) >>> 8;
						// int mask = 0x00FFFF00; mask to keep sprite tile and attribute
						Coprocessor1.updateRegister(OAMindex,
								((Coprocessor1.getValue(OAMindex) & 0x00FFFF00) + (sslX << 24) + sslY)); // could have shift 16 more since it already shifted by 8
						//spriteData[OAMindex].setyPosition(sslY);
						//spriteData[OAMindex].setxPosition(sslX);
					}
				}));
		instructionList.add(        
				new BasicInstruction("sft $t0, $t1", 
						"Set Foreground Tile : Set Coprocessor register $t0[5:0][23:16] to $t1[7:0]",
						BasicInstructionFormat.R_FORMAT,
						"010100 fffff sssss 0000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int OAMindex = RegisterFile.getValue(operands[0]) & 0x0000003F;
						int sft = RegisterFile.getValue(operands[1]) & 0x000000FF;
						Coprocessor1.updateRegister(OAMindex,
								((Coprocessor1.getValue(OAMindex) & 0xFF00FFFF) + (sft << 16)));
						//spriteData[OAMindex].setBufferedImage(spritePatternTable[sft]);
					}
				}));
		instructionList.add(        
				new BasicInstruction("sbt $t0, $t1", 
						"Set Background Tile : Set Background tile register $t0[9:0] to $t1[7:0]",
						BasicInstructionFormat.R_FORMAT,
						"010101 fffff sssss 0000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int BGindex = RegisterFile.getValue(operands[0]) & 0x000003FF;
						int sbt = RegisterFile.getValue(operands[1]) & 0x000000FF;
						backgroundTile[BGindex] = sbt;
						groundVisual[BGindex % (DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION)][BGindex / (DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION)] = setColorPalette(backgroundPatternTable[backgroundTile[BGindex]], backgroundAttribute[BGindex]);
					}
				}));
		instructionList.add(        
				new BasicInstruction("sfa $t0, $t1", 
						"Set Foreground Tile : Set Coprocessor register $t0[5:0][15:8] to $t1[7:0]",
						BasicInstructionFormat.R_FORMAT,
						"010110 fffff sssss 0000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int OAMindex = RegisterFile.getValue(operands[0]) & 0x0000003F;
						int sfa = RegisterFile.getValue(operands[1]) & 0x000000FF;
						Coprocessor1.updateRegister(OAMindex,
								((Coprocessor1.getValue(OAMindex) & 0xFFFF00FF) + (sfa << 8)));
						//spriteData[OAMindex].setColorPaletteIndex(sfa & 0x00000003);
						//spriteData[OAMindex].setFlipVertical((sfa & 0x00000080) == 0x00000080);
						//spriteData[OAMindex].setFlipHorizontal((sfa & 0x00000040) == 0x00000040);
					}
				}));
		instructionList.add(        
				new BasicInstruction("sba $t0, $t1", 
						"Set Background Tile : Set Background tile register $t0[9:0] to $t1[1:0]",
						BasicInstructionFormat.R_FORMAT,
						"010111 fffff sssss 0000000000000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int BGindex = RegisterFile.getValue(operands[0]) & 0x000003FF;
						int sba = RegisterFile.getValue(operands[1]) & 0x00000003;
						backgroundAttribute[BGindex] = sba;
						groundVisual[BGindex % (DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION)][BGindex / (DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION)] = setColorPalette(backgroundPatternTable[backgroundTile[BGindex]], backgroundAttribute[BGindex]);
					}
				}));
		instructionList.add(        
				new BasicInstruction("mfc0 $t1,$8", 
						"Move from Coprocessor 0 : Set $t1 to the value stored in Coprocessor 0 register $8",
						BasicInstructionFormat.R_FORMAT,
						"010000 00000 fffff sssss 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						RegisterFile.updateRegister(operands[0],
								Coprocessor0.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("mtc0 $t1,$8", 
						"Move to Coprocessor 0 : Set Coprocessor 0 register $8 to value stored in $t1",
						BasicInstructionFormat.R_FORMAT,
						"010000 00100 fffff sssss 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						Coprocessor0.updateRegister(operands[1],
								RegisterFile.getValue(operands[0]));
					}
				}));

		/////////////////////// Floating Point Instructions Start Here ////////////////
		instructionList.add(
				new BasicInstruction("add.s $f0,$f1,$f3",
						"Floating point addition single precision : Set $f0 to single-precision floating point value of $f1 plus $f3", 
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fffff 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float add1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float add2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						float sum = add1 + add2;
						// overflow detected when sum is positive or negative infinity.
						/*
                  if (sum == Float.NEGATIVE_INFINITY || sum == Float.POSITIVE_INFINITY) {
                    throw new ProcessingException(statement,"arithmetic overflow");
                  }
						 */
						Coprocessor1.updateRegister(operands[0], Float.floatToIntBits(sum));
					}
				}));
		instructionList.add(
				new BasicInstruction("sub.s $f0,$f1,$f3",
						"Floating point subtraction single precision : Set $f0 to single-precision floating point value of $f1  minus $f3",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fffff 000001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float sub1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float sub2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						float diff = sub1 - sub2;
						Coprocessor1.updateRegister(operands[0], Float.floatToIntBits(diff));
					}
				}));
		instructionList.add(
				new BasicInstruction("mul.s $f0,$f1,$f3",
						"Floating point multiplication single precision : Set $f0 to single-precision floating point value of $f1 times $f3",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fffff 000010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float mul1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float mul2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						float prod = mul1 * mul2;
						Coprocessor1.updateRegister(operands[0], Float.floatToIntBits(prod));
					}
				}));
		instructionList.add(
				new BasicInstruction("div.s $f0,$f1,$f3",
						"Floating point division single precision : Set $f0 to single-precision floating point value of $f1 divided by $f3",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fffff 000011",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float div1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float div2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						float quot = div1 / div2;
						Coprocessor1.updateRegister(operands[0], Float.floatToIntBits(quot));
					}
				}));
		instructionList.add(
				new BasicInstruction("sqrt.s $f0,$f1",
						"Square root single precision : Set $f0 to single-precision floating point square root of $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 000100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float value = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						int floatSqrt = 0;
						if (value < 0.0f) {
							// This is subject to refinement later.  Release 4.0 defines floor, ceil, trunc, round
							// to act silently rather than raise Invalid Operation exception, so sqrt should do the
							// same.  An intermediate step would be to define a setting for FCSR Invalid Operation
							// flag, but the best solution is to simulate the FCSR register itself.
							// FCSR = Floating point unit Control and Status Register.  DPS 10-Aug-2010
							floatSqrt = Float.floatToIntBits( Float.NaN);
							//throw new ProcessingException(statement, "Invalid Operation: sqrt of negative number");
						} 
						else {
							floatSqrt = Float.floatToIntBits( (float) Math.sqrt(value));
						}
						Coprocessor1.updateRegister(operands[0], floatSqrt);
					}
				}));
		instructionList.add(
				new BasicInstruction("floor.w.s $f0,$f1",
						"Floor single precision to word : Set $f0 to 32-bit integer floor of single-precision float in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 001111",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float floatValue = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));	
						int floor = (int) Math.floor(floatValue);
						// DPS 28-July-2010: Since MARS does not simulate the FSCR, I will take the default
						// action of setting the result to 2^31-1, if the value is outside the 32 bit range.
						if ( Float.isNaN(floatValue) 
								|| Float.isInfinite(floatValue)
								|| floatValue < (float) Integer.MIN_VALUE 
								|| floatValue > (float) Integer.MAX_VALUE ) {							
							floor = Integer.MAX_VALUE;
						}
						Coprocessor1.updateRegister(operands[0], floor);
					}
				}));
		instructionList.add(
				new BasicInstruction("ceil.w.s $f0,$f1",
						"Ceiling single precision to word : Set $f0 to 32-bit integer ceiling of single-precision float in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 001110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float floatValue = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));	
						int ceiling = (int) Math.ceil(floatValue);
						// DPS 28-July-2010: Since MARS does not simulate the FSCR, I will take the default
						// action of setting the result to 2^31-1, if the value is outside the 32 bit range.
						if ( Float.isNaN(floatValue) 
								|| Float.isInfinite(floatValue)
								|| floatValue < (float) Integer.MIN_VALUE 
								|| floatValue > (float) Integer.MAX_VALUE ) {							
							ceiling = Integer.MAX_VALUE;
						}
						Coprocessor1.updateRegister(operands[0], ceiling);
					}
				}));
		instructionList.add(
				new BasicInstruction("round.w.s $f0,$f1",
						"Round single precision to word : Set $f0 to 32-bit integer round of single-precision float in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 001100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ // MIPS32 documentation (and IEEE 754) states that round rounds to the nearest but when
						// both are equally near it rounds to the even one!  SPIM rounds -4.5, -5.5,
						// 4.5 and 5.5 to (-4, -5, 5, 6).  Curiously, it rounds -5.1 to -4 and -5.6 to -5. 
						// Until MARS 3.5, I used Math.round, which rounds to nearest but when both are
						// equal it rounds toward positive infinity.  With Release 3.5, I painstakingly
						// carry out the MIPS and IEEE 754 standard.
						int[] operands = statement.getOperands();
						float floatValue = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						int below=0, above=0, round = Math.round(floatValue);
						// According to MIPS32 spec, if any of these conditions is true, set
						// Invalid Operation in the FCSR (Floating point Control/Status Register) and
						// set result to be 2^31-1.  MARS does not implement this register (as of release 3.4.1).
						// It also mentions the "Invalid Operation Enable bit" in FCSR, that, if set, results
						// in immediate exception instead of default value.  
						if ( Float.isNaN(floatValue) 
								|| Float.isInfinite(floatValue)
								|| floatValue < (float) Integer.MIN_VALUE 
								|| floatValue > (float) Integer.MAX_VALUE ) {
							round = Integer.MAX_VALUE;
						} 
						else {
							Float floatObj = new Float(floatValue);
							// If we are EXACTLY in the middle, then round to even!  To determine this,
							// find next higher integer and next lower integer, then see if distances 
							// are exactly equal.
							if (floatValue < 0.0F) {
								above = floatObj.intValue(); // truncates
								below = above - 1;
							} 
							else {
								below = floatObj.intValue(); // truncates
								above = below + 1;
							}
							if (floatValue - below == above - floatValue) { // exactly in the middle?
								round = (above%2 == 0) ? above : below;
							}
						}
						Coprocessor1.updateRegister(operands[0], round);
					}
				}));
		instructionList.add(
				new BasicInstruction("trunc.w.s $f0,$f1",
						"Truncate single precision to word : Set $f0 to 32-bit integer truncation of single-precision float in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 001101",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float floatValue = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));	
						int truncate = (int) floatValue;// Typecasting will round toward zero, the correct action
						// DPS 28-July-2010: Since MARS does not simulate the FSCR, I will take the default
						// action of setting the result to 2^31-1, if the value is outside the 32 bit range.
						if ( Float.isNaN(floatValue) 
								|| Float.isInfinite(floatValue)
								|| floatValue < (float) Integer.MIN_VALUE 
								|| floatValue > (float) Integer.MAX_VALUE ) {							
							truncate = Integer.MAX_VALUE;
						}
						Coprocessor1.updateRegister(operands[0], truncate);
					}
				}));
		instructionList.add(
				new BasicInstruction("add.d $f2,$f4,$f6",
						"Floating point addition double precision : Set $f2 to double-precision floating point value of $f4 plus $f6",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fffff 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "all registers must be even-numbered");
						}
						double add1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double add2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						double sum  = add1 + add2;
						long longSum = Double.doubleToLongBits(sum);
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(longSum));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(longSum));
					}
				}));
		instructionList.add(
				new BasicInstruction("sub.d $f2,$f4,$f6",
						"Floating point subtraction double precision : Set $f2 to double-precision floating point value of $f4 minus $f6",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fffff 000001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "all registers must be even-numbered");
						}
						double sub1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double sub2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						double diff = sub1 - sub2;
						long longDiff = Double.doubleToLongBits(diff);
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(longDiff));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(longDiff));
					}
				}));
		instructionList.add(
				new BasicInstruction("mul.d $f2,$f4,$f6",
						"Floating point multiplication double precision : Set $f2 to double-precision floating point value of $f4 times $f6",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fffff 000010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "all registers must be even-numbered");
						}
						double mul1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double mul2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						double prod  = mul1 * mul2;
						long longProd = Double.doubleToLongBits(prod);
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(longProd));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(longProd));
					}
				}));
		instructionList.add(
				new BasicInstruction("div.d $f2,$f4,$f6",
						"Floating point division double precision : Set $f2 to double-precision floating point value of $f4 divided by $f6",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fffff 000011",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "all registers must be even-numbered");
						}
						double div1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double div2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						double quot  = div1 / div2;
						long longQuot = Double.doubleToLongBits(quot);
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(longQuot));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(longQuot));
					}
				}));
		instructionList.add(
				new BasicInstruction("sqrt.d $f2,$f4",
						"Square root double precision : Set $f2 to double-precision floating point square root of $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 000100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double value = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						long longSqrt = 0;              
						if (value < 0.0) {
							// This is subject to refinement later.  Release 4.0 defines floor, ceil, trunc, round
							// to act silently rather than raise Invalid Operation exception, so sqrt should do the
							// same.  An intermediate step would be to define a setting for FCSR Invalid Operation
							// flag, but the best solution is to simulate the FCSR register itself.
							// FCSR = Floating point unit Control and Status Register.  DPS 10-Aug-2010
							longSqrt = Double.doubleToLongBits(Double.NaN);
							//throw new ProcessingException(statement, "Invalid Operation: sqrt of negative number");
						} 
						else {
							longSqrt = Double.doubleToLongBits(Math.sqrt(value));
						}
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(longSqrt));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(longSqrt));
					}
				}));
		instructionList.add(
				new BasicInstruction("floor.w.d $f1,$f2",
						"Floor double precision to word : Set $f1 to 32-bit integer floor of double-precision float in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 001111",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[1]%2==1) {
							throw new ProcessingException(statement, "second register must be even-numbered");
						}
						double doubleValue = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						// DPS 27-July-2010: Since MARS does not simulate the FSCR, I will take the default
						// action of setting the result to 2^31-1, if the value is outside the 32 bit range.
						int floor = (int) Math.floor(doubleValue);
						if ( Double.isNaN(doubleValue) 
								|| Double.isInfinite(doubleValue)
								|| doubleValue < (double) Integer.MIN_VALUE 
								|| doubleValue > (double) Integer.MAX_VALUE ) {
							floor = Integer.MAX_VALUE;
						} 
						Coprocessor1.updateRegister(operands[0], floor);
					}
				}));
		instructionList.add(
				new BasicInstruction("ceil.w.d $f1,$f2",
						"Ceiling double precision to word : Set $f1 to 32-bit integer ceiling of double-precision float in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 001110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[1]%2==1) {
							throw new ProcessingException(statement, "second register must be even-numbered");
						}
						double doubleValue = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						// DPS 27-July-2010: Since MARS does not simulate the FSCR, I will take the default
						// action of setting the result to 2^31-1, if the value is outside the 32 bit range.
						int ceiling = (int) Math.ceil(doubleValue);
						if ( Double.isNaN(doubleValue) 
								|| Double.isInfinite(doubleValue)
								|| doubleValue < (double) Integer.MIN_VALUE 
								|| doubleValue > (double) Integer.MAX_VALUE ) {
							ceiling = Integer.MAX_VALUE;
						} 
						Coprocessor1.updateRegister(operands[0], ceiling);
					}
				}));
		instructionList.add(
				new BasicInstruction("round.w.d $f1,$f2",
						"Round double precision to word : Set $f1 to 32-bit integer round of double-precision float in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 001100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ // See comments in round.w.s above, concerning MIPS and IEEE 754 standard. 
						// Until MARS 3.5, I used Math.round, which rounds to nearest but when both are
						// equal it rounds toward positive infinity.  With Release 3.5, I painstakingly
						// carry out the MIPS and IEEE 754 standard (round to nearest/even).
						int[] operands = statement.getOperands();
						if (operands[1]%2==1) {
							throw new ProcessingException(statement, "second register must be even-numbered");
						}
						double doubleValue = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						int below=0, above=0; 
						int round = (int) Math.round(doubleValue);
						// See comments in round.w.s above concerning FSCR...  
						if ( Double.isNaN(doubleValue) 
								|| Double.isInfinite(doubleValue)
								|| doubleValue < (double) Integer.MIN_VALUE 
								|| doubleValue > (double) Integer.MAX_VALUE ) {
							round = Integer.MAX_VALUE;
						} 
						else {
							Double doubleObj = new Double(doubleValue);
							// If we are EXACTLY in the middle, then round to even!  To determine this,
							// find next higher integer and next lower integer, then see if distances 
							// are exactly equal.
							if (doubleValue < 0.0) {
								above = doubleObj.intValue(); // truncates
								below = above - 1;
							} 
							else {
								below = doubleObj.intValue(); // truncates
								above = below + 1;
							}
							if (doubleValue - below == above - doubleValue) { // exactly in the middle?
								round = (above%2 == 0) ? above : below;
							}
						}
						Coprocessor1.updateRegister(operands[0], round);
					}
				}));
		instructionList.add(
				new BasicInstruction("trunc.w.d $f1,$f2",
						"Truncate double precision to word : Set $f1 to 32-bit integer truncation of double-precision float in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 001101",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[1]%2==1) {
							throw new ProcessingException(statement, "second register must be even-numbered");
						}
						double doubleValue = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						// DPS 27-July-2010: Since MARS does not simulate the FSCR, I will take the default
						// action of setting the result to 2^31-1, if the value is outside the 32 bit range.
						int truncate = (int) doubleValue; // Typecasting will round toward zero, the correct action.
						if ( Double.isNaN(doubleValue) 
								|| Double.isInfinite(doubleValue)
								|| doubleValue < (double) Integer.MIN_VALUE 
								|| doubleValue > (double) Integer.MAX_VALUE ) {
							truncate = Integer.MAX_VALUE;
						} 
						Coprocessor1.updateRegister(operands[0], truncate);
					}
				}));
		instructionList.add(
				new BasicInstruction("bc1t label",
						"Branch if FP condition flag 0 true (BC1T, not BCLT) : If Coprocessor 1 condition flag 0 is true (one) then branch to statement at label's address",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"010001 01000 00001 ffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(0)==1)
						{
							processBranch(operands[0]);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("bc1t 1,label",
						"Branch if specified FP condition flag true (BC1T, not BCLT) : If Coprocessor 1 condition flag specified by immediate is true (one) then branch to statement at label's address",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"010001 01000 fff 01 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(operands[0])==1)
						{
							processBranch(operands[1]);
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("bc1f label",
						"Branch if FP condition flag 0 false (BC1F, not BCLF) : If Coprocessor 1 condition flag 0 is false (zero) then branch to statement at label's address",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"010001 01000 00000 ffffffffffffffff",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(0)==0)
						{
							processBranch(operands[0]);
						}

					}
				}));
		instructionList.add(
				new BasicInstruction("bc1f 1,label",
						"Branch if specified FP condition flag false (BC1F, not BCLF) : If Coprocessor 1 condition flag specified by immediate is false (zero) then branch to statement at label's address",
						BasicInstructionFormat.I_BRANCH_FORMAT,
						"010001 01000 fff 00 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(operands[0])==0)
						{
							processBranch(operands[1]);
						}

					}
				}));
		instructionList.add(
				new BasicInstruction("c.eq.s $f0,$f1",
						"Compare equal single precision : If $f0 is equal to $f1, set Coprocessor 1 condition flag 0 true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 sssss fffff 00000 110010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float op1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[0]));
						float op2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						if (op1 == op2) 
							Coprocessor1.setConditionFlag(0);
						else
							Coprocessor1.clearConditionFlag(0);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.eq.s 1,$f0,$f1",
						"Compare equal single precision : If $f0 is equal to $f1, set Coprocessor 1 condition flag specied by immediate to true else set it to false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fff 00 11 0010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float op1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float op2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						if (op1 == op2) 
							Coprocessor1.setConditionFlag(operands[0]);
						else
							Coprocessor1.clearConditionFlag(operands[0]);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.le.s $f0,$f1",
						"Compare less or equal single precision : If $f0 is less than or equal to $f1, set Coprocessor 1 condition flag 0 true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 sssss fffff 00000 111110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float op1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[0]));
						float op2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						if (op1 <= op2) 
							Coprocessor1.setConditionFlag(0);
						else
							Coprocessor1.clearConditionFlag(0);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.le.s 1,$f0,$f1",
						"Compare less or equal single precision : If $f0 is less than or equal to $f1, set Coprocessor 1 condition flag specified by immediate to true else set it to false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fff 00 111110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float op1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float op2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						if (op1 <= op2) 
							Coprocessor1.setConditionFlag(operands[0]);
						else
							Coprocessor1.clearConditionFlag(operands[0]);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.lt.s $f0,$f1",
						"Compare less than single precision : If $f0 is less than $f1, set Coprocessor 1 condition flag 0 true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 sssss fffff 00000 111100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float op1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[0]));
						float op2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						if (op1 < op2) 
							Coprocessor1.setConditionFlag(0);
						else
							Coprocessor1.clearConditionFlag(0);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.lt.s 1,$f0,$f1",
						"Compare less than single precision : If $f0 is less than $f1, set Coprocessor 1 condition flag specified by immediate to true else set it to false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fff 00 111100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						float op1 = Float.intBitsToFloat(Coprocessor1.getValue(operands[1]));
						float op2 = Float.intBitsToFloat(Coprocessor1.getValue(operands[2]));
						if (op1 < op2) 
							Coprocessor1.setConditionFlag(operands[0]);
						else
							Coprocessor1.clearConditionFlag(operands[0]);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.eq.d $f2,$f4",
						"Compare equal double precision : If $f2 is equal to $f4 (double-precision), set Coprocessor 1 condition flag 0 true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 sssss fffff 00000 110010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double op1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[0]+1),Coprocessor1.getValue(operands[0])));
						double op2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						if (op1 == op2) 
							Coprocessor1.setConditionFlag(0);
						else
							Coprocessor1.clearConditionFlag(0);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.eq.d 1,$f2,$f4",
						"Compare equal double precision : If $f2 is equal to $f4 (double-precision), set Coprocessor 1 condition flag specified by immediate to true else set it to false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fff 00 110010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double op1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double op2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						if (op1 == op2) 
							Coprocessor1.setConditionFlag(operands[0]);
						else
							Coprocessor1.clearConditionFlag(operands[0]);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.le.d $f2,$f4",
						"Compare less or equal double precision : If $f2 is less than or equal to $f4 (double-precision), set Coprocessor 1 condition flag 0 true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 sssss fffff 00000 111110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double op1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[0]+1),Coprocessor1.getValue(operands[0])));
						double op2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						if (op1 <= op2) 
							Coprocessor1.setConditionFlag(0);
						else
							Coprocessor1.clearConditionFlag(0);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.le.d 1,$f2,$f4",
						"Compare less or equal double precision : If $f2 is less than or equal to $f4 (double-precision), set Coprocessor 1 condition flag specfied by immediate true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fff 00 111110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double op1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double op2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						if (op1 <= op2) 
							Coprocessor1.setConditionFlag(operands[0]);
						else
							Coprocessor1.clearConditionFlag(operands[0]);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.lt.d $f2,$f4",
						"Compare less than double precision : If $f2 is less than $f4 (double-precision), set Coprocessor 1 condition flag 0 true else set it false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 sssss fffff 00000 111100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double op1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[0]+1),Coprocessor1.getValue(operands[0])));
						double op2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						if (op1 < op2) 
							Coprocessor1.setConditionFlag(0);
						else
							Coprocessor1.clearConditionFlag(0);
					}
				}));
		instructionList.add(
				new BasicInstruction("c.lt.d 1,$f2,$f4",
						"Compare less than double precision : If $f2 is less than $f4 (double-precision), set Coprocessor 1 condition flag specified by immediate to true else set it to false",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fff 00 111100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[1]%2==1 || operands[2]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						double op1 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						double op2 = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[2]+1),Coprocessor1.getValue(operands[2])));
						if (op1 < op2) 
							Coprocessor1.setConditionFlag(operands[0]);
						else
							Coprocessor1.clearConditionFlag(operands[0]);
					}
				}));
		instructionList.add(
				new BasicInstruction("abs.s $f0,$f1",
						"Floating point absolute value single precision : Set $f0 to absolute value of $f1, single precision",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 000101",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						// I need only clear the high order bit!
						Coprocessor1.updateRegister(operands[0], 
								Coprocessor1.getValue(operands[1]) & Integer.MAX_VALUE);
					}
				}));
		instructionList.add(
				new BasicInstruction("abs.d $f2,$f4",
						"Floating point absolute value double precision : Set $f2 to absolute value of $f4, double precision",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 000101",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						// I need only clear the high order bit of high word register!
						Coprocessor1.updateRegister(operands[0]+1, 
								Coprocessor1.getValue(operands[1]+1) & Integer.MAX_VALUE);
						Coprocessor1.updateRegister(operands[0], 
								Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("cvt.d.s $f2,$f1",
						"Convert from single precision to double precision : Set $f2 to double precision equivalent of single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 100001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1) {
							throw new ProcessingException(statement, "first register must be even-numbered");
						}
						// convert single precision in $f1 to double stored in $f2
						long result = Double.doubleToLongBits(
								(double)Float.intBitsToFloat(Coprocessor1.getValue(operands[1])));
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(result));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(result));
					}
				}));
		instructionList.add(
				new BasicInstruction("cvt.d.w $f2,$f1",
						"Convert from word to double precision : Set $f2 to double precision equivalent of 32-bit integer value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10100 00000 sssss fffff 100001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1) {
							throw new ProcessingException(statement, "first register must be even-numbered");
						}
						// convert integer to double (interpret $f1 value as int?)
						long result = Double.doubleToLongBits(
								(double)Coprocessor1.getValue(operands[1]));
						Coprocessor1.updateRegister(operands[0]+1, Binary.highOrderLongToInt(result));
						Coprocessor1.updateRegister(operands[0], Binary.lowOrderLongToInt(result));
					}
				}));
		instructionList.add(
				new BasicInstruction("cvt.s.d $f1,$f2",
						"Convert from double precision to single precision : Set $f1 to single precision equivalent of double precision value in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 100000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						// convert double precision in $f2 to single stored in $f1
						if (operands[1]%2==1) {
							throw new ProcessingException(statement, "second register must be even-numbered");
						}
						double val = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						Coprocessor1.updateRegister(operands[0], Float.floatToIntBits((float)val));
					}
				}));
		instructionList.add(
				new BasicInstruction("cvt.s.w $f0,$f1",
						"Convert from word to single precision : Set $f0 to single precision equivalent of 32-bit integer value in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10100 00000 sssss fffff 100000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						// convert integer to single (interpret $f1 value as int?)
						Coprocessor1.updateRegister(operands[0], 
								Float.floatToIntBits((float)Coprocessor1.getValue(operands[1])));
					}
				}));
		instructionList.add(
				new BasicInstruction("cvt.w.d $f1,$f2",
						"Convert from double precision to word : Set $f1 to 32-bit integer equivalent of double precision value in $f2",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 100100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						// convert double precision in $f2 to integer stored in $f1
						if (operands[1]%2==1) {
							throw new ProcessingException(statement, "second register must be even-numbered");
						}
						double val = Double.longBitsToDouble(Binary.twoIntsToLong(
								Coprocessor1.getValue(operands[1]+1),Coprocessor1.getValue(operands[1])));
						Coprocessor1.updateRegister(operands[0], (int) val);
					}
				}));
		instructionList.add(
				new BasicInstruction("cvt.w.s $f0,$f1",
						"Convert from single precision to word : Set $f0 to 32-bit integer equivalent of single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 100100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						// convert single precision in $f1 to integer stored in $f0
						Coprocessor1.updateRegister(operands[0], 
								(int)Float.intBitsToFloat(Coprocessor1.getValue(operands[1])));
					}
				}));
		instructionList.add(
				new BasicInstruction("mov.d $f2,$f4",
						"Move floating point double precision : Set double precision $f2 to double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 000110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
						Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
					}
				}));
		instructionList.add(
				new BasicInstruction("movf.d $f2,$f4",
						"Move floating point double precision : If condition flag 0 false, set double precision $f2 to double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 000 00 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						if (Coprocessor1.getConditionFlag(0)==0) {
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
							Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("movf.d $f2,$f4,1",
						"Move floating point double precision : If condition flag specified by immediate is false, set double precision $f2 to double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttt 00 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						if (Coprocessor1.getConditionFlag(operands[2])==0) {
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
							Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("movt.d $f2,$f4",
						"Move floating point double precision : If condition flag 0 true, set double precision $f2 to double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 000 01 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						if (Coprocessor1.getConditionFlag(0)==1) {
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
							Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("movt.d $f2,$f4,1",
						"Move floating point double precision : If condition flag specified by immediate is true, set double precision $f2 to double precision value in $f4e",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttt 01 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						if (Coprocessor1.getConditionFlag(operands[2])==1) {
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
							Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("movn.d $f2,$f4,$t3",
						"Move floating point double precision : If $t3 is not zero, set double precision $f2 to double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fffff 010011",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						if (RegisterFile.getValue(operands[2])!=0) {
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
							Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("movz.d $f2,$f4,$t3",
						"Move floating point double precision : If $t3 is zero, set double precision $f2 to double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 ttttt sssss fffff 010010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						if (RegisterFile.getValue(operands[2])==0) {
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
							Coprocessor1.updateRegister(operands[0]+1, Coprocessor1.getValue(operands[1]+1));
						}
					}
				}));
		instructionList.add(
				new BasicInstruction("mov.s $f0,$f1",
						"Move floating point single precision : Set single precision $f0 to single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 000110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("movf.s $f0,$f1",
						"Move floating point single precision : If condition flag 0 is false, set single precision $f0 to single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 000 00 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(0)==0)
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("movf.s $f0,$f1,1",
						"Move floating point single precision : If condition flag specified by immediate is false, set single precision $f0 to single precision value in $f1e",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttt 00 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(operands[2])==0)
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("movt.s $f0,$f1",
						"Move floating point single precision : If condition flag 0 is true, set single precision $f0 to single precision value in $f1e",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 000 01 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(0)==1)
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("movt.s $f0,$f1,1",
						"Move floating point single precision : If condition flag specified by immediate is true, set single precision $f0 to single precision value in $f1e",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttt 01 sssss fffff 010001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (Coprocessor1.getConditionFlag(operands[2])==1)
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("movn.s $f0,$f1,$t3",
						"Move floating point single precision : If $t3 is not zero, set single precision $f0 to single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fffff 010011",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[2])!=0)
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("movz.s $f0,$f1,$t3",
						"Move floating point single precision : If $t3 is zero, set single precision $f0 to single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 ttttt sssss fffff 010010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[2])==0)
							Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("mfc1 $t1,$f1",
						"Move from Coprocessor 1 (FPU) : Set $t1 to value in Coprocessor 1 register $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 00000 fffff sssss 00000 000000", 
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						RegisterFile.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("mtc1 $t1,$f1",
						"Move to Coprocessor 1 (FPU) : Set Coprocessor 1 register $f1 to value in $t1",
						BasicInstructionFormat.R_FORMAT,
						"010001 00100 fffff sssss 00000 000000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						Coprocessor1.updateRegister(operands[1], RegisterFile.getValue(operands[0]));
					}
				}));
		instructionList.add(
				new BasicInstruction("neg.d $f2,$f4",
						"Floating point negate double precision : Set double precision $f2 to negation of double precision value in $f4",
						BasicInstructionFormat.R_FORMAT,
						"010001 10001 00000 sssss fffff 000111",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1 || operands[1]%2==1) {
							throw new ProcessingException(statement, "both registers must be even-numbered");
						}
						// flip the sign bit of the second register (high order word) of the pair
						int value = Coprocessor1.getValue(operands[1]+1);
						Coprocessor1.updateRegister(operands[0]+1, 
								((value < 0) ? (value & Integer.MAX_VALUE) : (value | Integer.MIN_VALUE)));
						Coprocessor1.updateRegister(operands[0], Coprocessor1.getValue(operands[1]));
					}
				}));
		instructionList.add(
				new BasicInstruction("neg.s $f0,$f1",
						"Floating point negate single precision : Set single precision $f0 to negation of single precision value in $f1",
						BasicInstructionFormat.R_FORMAT,
						"010001 10000 00000 sssss fffff 000111",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						int value = Coprocessor1.getValue(operands[1]);
						// flip the sign bit
						Coprocessor1.updateRegister(operands[0], 
								((value < 0) ? (value & Integer.MAX_VALUE) : (value | Integer.MIN_VALUE)));
					}
				}));
		instructionList.add(
				new BasicInstruction("lwc1 $f1,-100($t2)",
						"Load word into Coprocessor 1 (FPU) : Set $f1 to 32-bit value from effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"110001 ttttt fffff ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						try
						{
							Coprocessor1.updateRegister(operands[0],
									Globals.memory.getWord(
											RegisterFile.getValue(operands[2]) + operands[1]));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));		 
		instructionList.add(// no printed reference, got opcode from SPIM
				new BasicInstruction("ldc1 $f2,-100($t2)",
						"Load double word Coprocessor 1 (FPU)) : Set $f2 to 64-bit value from effective memory doubleword address",
						BasicInstructionFormat.I_FORMAT,
						"110101 ttttt fffff ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1) {
							throw new ProcessingException(statement, "first register must be even-numbered");
						}
						// IF statement added by DPS 13-July-2011.
						if (!Globals.memory.doublewordAligned(RegisterFile.getValue(operands[2]) + operands[1])) {
							throw new ProcessingException(statement,
									new AddressErrorException("address not aligned on doubleword boundary ",
											Exceptions.ADDRESS_EXCEPTION_LOAD, RegisterFile.getValue(operands[2]) + operands[1]));
						}

						try
						{
							Coprocessor1.updateRegister(operands[0],
									Globals.memory.getWord(
											RegisterFile.getValue(operands[2]) + operands[1]));
							Coprocessor1.updateRegister(operands[0]+1,
									Globals.memory.getWord(
											RegisterFile.getValue(operands[2]) + operands[1] + 4));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));	 
		instructionList.add(
				new BasicInstruction("swc1 $f1,-100($t2)",
						"Store word from Coprocesor 1 (FPU) : Store 32 bit value in $f1 to effective memory word address",
						BasicInstructionFormat.I_FORMAT,
						"111001 ttttt fffff ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						try
						{
							Globals.memory.setWord(
									RegisterFile.getValue(operands[2]) + operands[1],
									Coprocessor1.getValue(operands[0]));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		instructionList.add( // no printed reference, got opcode from SPIM
				new BasicInstruction("sdc1 $f2,-100($t2)",
						"Store double word from Coprocessor 1 (FPU)) : Store 64 bit value in $f2 to effective memory doubleword address",
						BasicInstructionFormat.I_FORMAT,
						"111101 ttttt fffff ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (operands[0]%2==1) {
							throw new ProcessingException(statement, "first register must be even-numbered");
						}
						// IF statement added by DPS 13-July-2011.
						if (!Globals.memory.doublewordAligned(RegisterFile.getValue(operands[2]) + operands[1])) {
							throw new ProcessingException(statement,
									new AddressErrorException("address not aligned on doubleword boundary ",
											Exceptions.ADDRESS_EXCEPTION_STORE, RegisterFile.getValue(operands[2]) + operands[1]));
						}
						try
						{
							Globals.memory.setWord(
									RegisterFile.getValue(operands[2]) + operands[1],
									Coprocessor1.getValue(operands[0]));
							Globals.memory.setWord(
									RegisterFile.getValue(operands[2]) + operands[1] + 4,
									Coprocessor1.getValue(operands[0]+1));
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				}));
		////////////////////////////  THE TRAP INSTRUCTIONS & ERET  ////////////////////////////
		instructionList.add(
				new BasicInstruction("teq $t1,$t2",
						"Trap if equal : Trap if $t1 is equal to $t2",
						BasicInstructionFormat.R_FORMAT,
						"000000 fffff sssss 00000 00000 110100",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) == RegisterFile.getValue(operands[1]))
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						} 	                     
					}
				}));
		instructionList.add(
				new BasicInstruction("teqi $t1,-100",
						"Trap if equal to immediate : Trap if $t1 is equal to sign-extended 16 bit immediate",
						BasicInstructionFormat.I_FORMAT,
						"000001 fffff 01100 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) == (operands[1] << 16 >> 16)) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                
					}
				}));
		instructionList.add(
				new BasicInstruction("tne $t1,$t2",
						"Trap if not equal : Trap if $t1 is not equal to $t2",
						BasicInstructionFormat.R_FORMAT,
						"000000 fffff sssss 00000 00000 110110",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) != RegisterFile.getValue(operands[1]))
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                      
					}
				}));        
		instructionList.add(
				new BasicInstruction("tnei $t1,-100",
						"Trap if not equal to immediate : Trap if $t1 is not equal to sign-extended 16 bit immediate",
						BasicInstructionFormat.I_FORMAT,
						"000001 fffff 01110 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) != (operands[1] << 16 >> 16)) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                     
					}
				}));
		instructionList.add(
				new BasicInstruction("tge $t1,$t2",
						"Trap if greater or equal : Trap if $t1 is greater than or equal to $t2",
						BasicInstructionFormat.R_FORMAT,
						"000000 fffff sssss 00000 00000 110000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) >= RegisterFile.getValue(operands[1]))
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						} 	                     
					}
				}));
		instructionList.add(
				new BasicInstruction("tgeu $t1,$t2",
						"Trap if greater or equal unsigned : Trap if $t1 is greater than or equal to $t2 using unsigned comparision",
						BasicInstructionFormat.R_FORMAT,
						"000000 fffff sssss 00000 00000 110001",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						int first = RegisterFile.getValue(operands[0]);
						int second = RegisterFile.getValue(operands[1]);
						// if signs same, do straight compare; if signs differ & first negative then first greater else second
						if ((first >= 0 && second >= 0 || first < 0 && second < 0) ? (first >= second) : (first < 0) ) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                      
					}
				}));
		instructionList.add(
				new BasicInstruction("tgei $t1,-100",
						"Trap if greater than or equal to immediate : Trap if $t1 greater than or equal to sign-extended 16 bit immediate",
						BasicInstructionFormat.I_FORMAT,
						"000001 fffff 01000 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) >= (operands[1] << 16 >> 16)) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                    
					}
				}));
		instructionList.add(
				new BasicInstruction("tgeiu $t1,-100",
						"Trap if greater or equal to immediate unsigned : Trap if $t1 greater than or equal to sign-extended 16 bit immediate, unsigned comparison",
						BasicInstructionFormat.I_FORMAT,
						"000001 fffff 01001 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int first = RegisterFile.getValue(operands[0]);
						// 16 bit immediate value in operands[1] is sign-extended
						int second = operands[1] << 16 >> 16;
						// if signs same, do straight compare; if signs differ & first negative then first greater else second
						if ((first >= 0 && second >= 0 || first < 0 && second < 0) ? (first >= second) : (first < 0) ) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                
					}
				}));
		instructionList.add(
				new BasicInstruction("tlt $t1,$t2",
						"Trap if less than: Trap if $t1 less than $t2",
						BasicInstructionFormat.R_FORMAT,
						"000000 fffff sssss 00000 00000 110010",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) < RegisterFile.getValue(operands[1]))
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						} 	                     
					}
				}));
		instructionList.add(
				new BasicInstruction("tltu $t1,$t2",
						"Trap if less than unsigned : Trap if $t1 less than $t2, unsigned comparison",
						BasicInstructionFormat.R_FORMAT,
						"000000 fffff sssss 00000 00000 110011",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{ 
						int[] operands = statement.getOperands();
						int first = RegisterFile.getValue(operands[0]);
						int second = RegisterFile.getValue(operands[1]);
						// if signs same, do straight compare; if signs differ & first positive then first is less else second
						if ((first >= 0 && second >= 0 || first < 0 && second < 0) ? (first < second) : (first >= 0) ) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                    
					}
				}));
		instructionList.add(
				new BasicInstruction("tlti $t1,-100",
						"Trap if less than immediate : Trap if $t1 less than sign-extended 16-bit immediate",
						BasicInstructionFormat.I_FORMAT,
						"000001 fffff 01010 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						if (RegisterFile.getValue(operands[0]) < (operands[1] << 16 >> 16)) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						} 	                     
					}
				}));
		instructionList.add(
				new BasicInstruction("tltiu $t1,-100",
						"Trap if less than immediate unsigned : Trap if $t1 less than sign-extended 16-bit immediate, unsigned comparison",
						BasicInstructionFormat.I_FORMAT,
						"000001 fffff 01011 ssssssssssssssss",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						int first = RegisterFile.getValue(operands[0]);
						// 16 bit immediate value in operands[1] is sign-extended
						int second = operands[1] << 16 >> 16;
						// if signs same, do straight compare; if signs differ & first positive then first is less else second
						if ((first >= 0 && second >= 0 || first < 0 && second < 0) ? (first < second) : (first >= 0) ) 
						{
							throw new ProcessingException(statement,
									"trap",Exceptions.TRAP_EXCEPTION);
						}                   
					}
				}));
		instructionList.add(
				new BasicInstruction("eret", 
						"Exception return : Set Program Counter to Coprocessor 0 EPC register value, set Coprocessor Status register bit 1 (exception level) to zero",
						BasicInstructionFormat.R_FORMAT,
						"010000 1 0000000000000000000 011000",
						new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						// set EXL bit (bit 1) in Status register to 0 and set PC to EPC
						Coprocessor0.updateRegister(Coprocessor0.STATUS, 
								Binary.clearBit(Coprocessor0.getValue(Coprocessor0.STATUS), Coprocessor0.EXCEPTION_LEVEL));
						RegisterFile.setProgramCounter(Coprocessor0.getValue(Coprocessor0.EPC));
					}
				}));

		////////////// READ PSEUDO-INSTRUCTION SPECS FROM DATA FILE AND ADD //////////////////////
		addPseudoInstructions();

		////////////// GET AND CREATE LIST OF SYSCALL FUNCTION OBJECTS ////////////////////
		syscallLoader = new SyscallLoader();
		syscallLoader.loadSyscalls();

		// Initialization step.  Create token list for each instruction example.  This is
		// used by parser to determine user program correct syntax.
		for (int i = 0; i < instructionList.size(); i++)
		{
			Instruction inst = (Instruction) instructionList.get(i);
			inst.createExampleTokenList();
		}

		HashMap maskMap = new HashMap();
		ArrayList matchMaps = new ArrayList();
		for (int i = 0; i < instructionList.size(); i++) {
			Object rawInstr = instructionList.get(i);
			if (rawInstr instanceof BasicInstruction) {
				BasicInstruction basic = (BasicInstruction) rawInstr;
				Integer mask = Integer.valueOf(basic.getOpcodeMask());
				Integer match = Integer.valueOf(basic.getOpcodeMatch());
				HashMap matchMap = (HashMap) maskMap.get(mask);
				if (matchMap == null) {
					matchMap = new HashMap();
					maskMap.put(mask, matchMap);
					matchMaps.add(new MatchMap(mask, matchMap));
				}
				matchMap.put(match, basic);
			}
		}
		Collections.sort(matchMaps);
		this.opcodeMatchMaps = matchMaps;
	}

	public BasicInstruction findByBinaryCode(int binaryInstr) {
		ArrayList matchMaps = this.opcodeMatchMaps;
		for (int i = 0; i < matchMaps.size(); i++) {
			MatchMap map = (MatchMap) matchMaps.get(i);
			BasicInstruction ret = map.find(binaryInstr);
			if (ret != null) return ret;
		}
		return null;
	}

	/*  METHOD TO ADD PSEUDO-INSTRUCTIONS
	 */

	private void addPseudoInstructions()
	{
		InputStream is = null;
		BufferedReader in = null;
		try
		{
			// leading "/" prevents package name being prepended to filepath.
			is = this.getClass().getResourceAsStream("/PseudoOps.txt");
			in = new BufferedReader(new InputStreamReader(is));
		} 
		catch (NullPointerException e)
		{
			System.out.println(
					"Error: MIPS pseudo-instruction file PseudoOps.txt not found.");
			System.exit(0);
		}
		try
		{
			String line, pseudoOp, template, firstTemplate, token;
			String description;
			StringTokenizer tokenizer;
			while ((line = in.readLine()) != null) {
				// skip over: comment lines, empty lines, lines starting with blank.
				if (!line.startsWith("#") && !line.startsWith(" ")
						&& line.length() > 0)  {  
					description = "";
					tokenizer = new StringTokenizer(line, "\t");
					pseudoOp = tokenizer.nextToken();
					template = "";
					firstTemplate = null;
					while (tokenizer.hasMoreTokens()) {
						token = tokenizer.nextToken();
						if (token.startsWith("#")) {  
							// Optional description must be last token in the line.
							description = token.substring(1);
							break;
						}
						if (token.startsWith("COMPACT")) {
							// has second template for Compact (16-bit) memory config -- added DPS 3 Aug 2009
							firstTemplate = template;
							template = "";
							continue;
						} 
						template = template + token;
						if (tokenizer.hasMoreTokens()) {
							template = template + "\n";
						}
					}
					ExtendedInstruction inst = (firstTemplate == null)
							? new ExtendedInstruction(pseudoOp, template, description)
									: new ExtendedInstruction(pseudoOp, firstTemplate, template, description);
							instructionList.add(inst);
							//if (firstTemplate != null) System.out.println("\npseudoOp: "+pseudoOp+"\ndefault template:\n"+firstTemplate+"\ncompact template:\n"+template);
				}
			}
			in.close();
		} 
		catch (IOException ioe)
		{
			System.out.println(
					"Internal Error: MIPS pseudo-instructions could not be loaded.");
			System.exit(0);
		} 
		catch (Exception ioe)
		{
			System.out.println(
					"Error: Invalid MIPS pseudo-instruction specification.");
			System.exit(0);
		}

	}

	/**
	 *  Given an operator mnemonic, will return the corresponding Instruction object(s)
	 *  from the instruction set.  Uses straight linear search technique.
	 *  @param name operator mnemonic (e.g. addi, sw,...)
	 *  @return list of corresponding Instruction object(s), or null if not found.
	 */
	public ArrayList matchOperator(String name)
	{
		ArrayList matchingInstructions = null;
		// Linear search for now....
		for (int i = 0; i < instructionList.size(); i++)
		{
			if (((Instruction) instructionList.get(i)).getName().equalsIgnoreCase(name))
			{
				if (matchingInstructions == null) 
					matchingInstructions = new ArrayList();
				matchingInstructions.add(instructionList.get(i));
			}
		}
		return matchingInstructions;
	}


	/**
	 *  Given a string, will return the Instruction object(s) from the instruction
	 *  set whose operator mnemonic prefix matches it.  Case-insensitive.  For example
	 *  "s" will match "sw", "sh", "sb", etc.  Uses straight linear search technique.
	 *  @param name a string
	 *  @return list of matching Instruction object(s), or null if none match.
	 */
	public ArrayList prefixMatchOperator(String name)
	{
		ArrayList matchingInstructions = null;
		// Linear search for now....
		if (name != null) {
			for (int i = 0; i < instructionList.size(); i++)
			{
				if (((Instruction) instructionList.get(i)).getName().toLowerCase().startsWith(name.toLowerCase()))
				{
					if (matchingInstructions == null) 
						matchingInstructions = new ArrayList();
					matchingInstructions.add(instructionList.get(i));
				}
			}
		}
		return matchingInstructions;
	}

	/*
	 * Method to find and invoke a syscall given its service number.  Each syscall
	 * function is represented by an object in an array list.  Each object is of
	 * a class that implements Syscall or extends AbstractSyscall.
	 */

	private void findAndSimulateSyscall(int number, ProgramStatement statement) 
			throws ProcessingException {
		Syscall service = syscallLoader.findSyscall(number);
		if (service != null) {
			service.simulate(statement);
			return;
		}
		throw new ProcessingException(statement,
				"invalid or unimplemented syscall service: " +
						number + " ", Exceptions.SYSCALL_EXCEPTION);
	}

	/*
	 * Method to process a successful branch condition.  DO NOT USE WITH JUMP
	 * INSTRUCTIONS!  The branch operand is a relative displacement in words
	 * whereas the jump operand is an absolute address in bytes.
	 *
	 * The parameter is displacement operand from instruction.
	 *
	 * Handles delayed branching if that setting is enabled.
	 */
	// 4 January 2008 DPS:  The subtraction of 4 bytes (instruction length) after
	// the shift has been removed.  It is left in as commented-out code below.
	// This has the effect of always branching as if delayed branching is enabled, 
	// even if it isn't.  This mod must work in conjunction with
	// ProgramStatement.java, buildBasicStatementFromBasicInstruction() method near
	// the bottom (currently line 194, heavily commented).

	private void processBranch(int displacement) {
		
		// ECE554
		//System.out.println("processing branch");
		//System.out.println("RegisterFile.getProgramCounter() = " + RegisterFile.getProgramCounter());
		//System.out.println("displacement = " + displacement);
		//System.out.println("displacement << 2 = " + (displacement << 2));
		//System.out.println("final = " + (RegisterFile.getProgramCounter() + (displacement << 2)));
		if (Globals.getSettings().getDelayedBranchingEnabled()) {
			// Register the branch target address (absolute byte address).
			DelayedBranch.register(RegisterFile.getProgramCounter() + (displacement << 2));
		} 
		else {
			// Decrement needed because PC has already been incremented
			RegisterFile.setProgramCounter(
					RegisterFile.getProgramCounter()
					+ (displacement << 2)); // - Instruction.INSTRUCTION_LENGTH);	
		}	 
	}

	/*
	 * Method to process a jump.  DO NOT USE WITH BRANCH INSTRUCTIONS!  
	 * The branch operand is a relative displacement in words
	 * whereas the jump operand is an absolute address in bytes.
	 *
	 * The parameter is jump target absolute byte address.
	 *
	 * Handles delayed branching if that setting is enabled.
	 */

	private void processJump(int targetAddress) {
		
		// ECE554
		//System.out.println("processing branch");
		//System.out.println("RegisterFile.getProgramCounter() = " + RegisterFile.getProgramCounter());
		//System.out.println("targetAddress = " + targetAddress);
		if (Globals.getSettings().getDelayedBranchingEnabled()) {
			DelayedBranch.register(targetAddress);
		} 
		else {
			RegisterFile.setProgramCounter(targetAddress);
		}	 
	}

	/*
	 * Method to process storing of a return address in the given
	 * register.  This is used only by the "and link"
	 * instructions: jal, jalr, bltzal, bgezal.  If delayed branching
	 * setting is off, the return address is the address of the
	 * next instruction (e.g. the current PC value).  If on, the
	 * return address is the instruction following that, to skip over
	 * the delay slot.
	 *
	 * The parameter is register number to receive the return address.
	 */

	private void processReturnAddress(int register) {
		RegisterFile.updateRegister(register, RegisterFile.getProgramCounter() +
				((Globals.getSettings().getDelayedBranchingEnabled()) ? 
						Instruction.INSTRUCTION_LENGTH : 0) );	 
	}

	private static class MatchMap implements Comparable {
		private int mask;
		private int maskLength; // number of 1 bits in mask
		private HashMap matchMap;

		public MatchMap(int mask, HashMap matchMap) {
			this.mask = mask;
			this.matchMap = matchMap;

			int k = 0;
			int n = mask;
			while (n != 0) {
				k++;
				n &= n - 1;
			}
			this.maskLength = k;
		}

		public boolean equals(Object o) {
			return o instanceof MatchMap && mask == ((MatchMap) o).mask;
		}

		public int compareTo(Object other) {
			MatchMap o = (MatchMap) other;
			int d = o.maskLength - this.maskLength;
			if (d == 0) d = this.mask - o.mask;
			return d;
		}

		public BasicInstruction find(int instr) {
			int match = Integer.valueOf(instr & mask);
			return (BasicInstruction) matchMap.get(match);
		}
	}

	Integer getVisualIndex(int locationVisual) {
		switch (locationVisual) {
		case   0: return spriteAssemblerHash.get("background0000_index");
		case   1: return spriteAssemblerHash.get("background1000_index");
		case   2: return spriteAssemblerHash.get("background2000_index");
		case   3: return spriteAssemblerHash.get("background3000_index");
		case   4: return spriteAssemblerHash.get("background0100_index");
		case   5: return spriteAssemblerHash.get("background1100_index");
		case   6: return spriteAssemblerHash.get("background2100_index");
		case   7: return spriteAssemblerHash.get("background3100_index");
		case   8: return spriteAssemblerHash.get("background0200_index");
		case   9: return spriteAssemblerHash.get("background1200_index");
		case  10: return spriteAssemblerHash.get("background2200_index");
		case  11: return spriteAssemblerHash.get("background3200_index");
		case  12: return spriteAssemblerHash.get("background0300_index");
		case  13: return spriteAssemblerHash.get("background1300_index");
		case  14: return spriteAssemblerHash.get("background2300_index");
		case  15: return spriteAssemblerHash.get("background3300_index");
		case  16: return spriteAssemblerHash.get("background0010_index");
		case  17: return spriteAssemblerHash.get("background1010_index");
		case  18: return spriteAssemblerHash.get("background2010_index");
		case  19: return spriteAssemblerHash.get("background3010_index");
		case  20: return spriteAssemblerHash.get("background0110_index");
		case  21: return spriteAssemblerHash.get("background1110_index");
		case  22: return spriteAssemblerHash.get("background2110_index");
		case  23: return spriteAssemblerHash.get("background3110_index");
		case  24: return spriteAssemblerHash.get("background0210_index");
		case  25: return spriteAssemblerHash.get("background1210_index");
		case  26: return spriteAssemblerHash.get("background2210_index");
		case  27: return spriteAssemblerHash.get("background3210_index");
		case  28: return spriteAssemblerHash.get("background0310_index");
		case  29: return spriteAssemblerHash.get("background1310_index");
		case  30: return spriteAssemblerHash.get("background2310_index");
		case  31: return spriteAssemblerHash.get("background3310_index");
		case  32: return spriteAssemblerHash.get("background0020_index");
		case  33: return spriteAssemblerHash.get("background1020_index");
		case  34: return spriteAssemblerHash.get("background2020_index");
		case  35: return spriteAssemblerHash.get("background3020_index");
		case  36: return spriteAssemblerHash.get("background0120_index");
		case  37: return spriteAssemblerHash.get("background1120_index");
		case  38: return spriteAssemblerHash.get("background2120_index");
		case  39: return spriteAssemblerHash.get("background3120_index");
		case  40: return spriteAssemblerHash.get("background0220_index");
		case  41: return spriteAssemblerHash.get("background1220_index");
		case  42: return spriteAssemblerHash.get("background2220_index");
		case  43: return spriteAssemblerHash.get("background3220_index");
		case  44: return spriteAssemblerHash.get("background0320_index");
		case  45: return spriteAssemblerHash.get("background1320_index");
		case  46: return spriteAssemblerHash.get("background2320_index");
		case  47: return spriteAssemblerHash.get("background3320_index");
		case  48: return spriteAssemblerHash.get("background0030_index");
		case  49: return spriteAssemblerHash.get("background1030_index");
		case  50: return spriteAssemblerHash.get("background2030_index");
		case  51: return spriteAssemblerHash.get("background3030_index");
		case  52: return spriteAssemblerHash.get("background0130_index");
		case  53: return spriteAssemblerHash.get("background1130_index");
		case  54: return spriteAssemblerHash.get("background2130_index");
		case  55: return spriteAssemblerHash.get("background3130_index");
		case  56: return spriteAssemblerHash.get("background0230_index");
		case  57: return spriteAssemblerHash.get("background1230_index");
		case  58: return spriteAssemblerHash.get("background2230_index");
		case  59: return spriteAssemblerHash.get("background3230_index");
		case  60: return spriteAssemblerHash.get("background0330_index");
		case  61: return spriteAssemblerHash.get("background1330_index");
		case  62: return spriteAssemblerHash.get("background2330_index");
		case  63: return spriteAssemblerHash.get("background3330_index");
		case  64: return spriteAssemblerHash.get("background0001_index");
		case  65: return spriteAssemblerHash.get("background1001_index");
		case  66: return spriteAssemblerHash.get("background2001_index");
		case  67: return spriteAssemblerHash.get("background3001_index");
		case  68: return spriteAssemblerHash.get("background0101_index");
		case  69: return spriteAssemblerHash.get("background1101_index");
		case  70: return spriteAssemblerHash.get("background2101_index");
		case  71: return spriteAssemblerHash.get("background3101_index");
		case  72: return spriteAssemblerHash.get("background0201_index");
		case  73: return spriteAssemblerHash.get("background1201_index");
		case  74: return spriteAssemblerHash.get("background2201_index");
		case  75: return spriteAssemblerHash.get("background3201_index");
		case  76: return spriteAssemblerHash.get("background0301_index");
		case  77: return spriteAssemblerHash.get("background1301_index");
		case  78: return spriteAssemblerHash.get("background2301_index");
		case  79: return spriteAssemblerHash.get("background3301_index");
		case  80: return spriteAssemblerHash.get("background0011_index");
		case  81: return spriteAssemblerHash.get("background1011_index");
		case  82: return spriteAssemblerHash.get("background2011_index");
		case  83: return spriteAssemblerHash.get("background3011_index");
		case  84: return spriteAssemblerHash.get("background0111_index");
		case  85: return spriteAssemblerHash.get("background1111_index");
		case  86: return spriteAssemblerHash.get("background2111_index");
		case  87: return spriteAssemblerHash.get("background3111_index");
		case  88: return spriteAssemblerHash.get("background0211_index");
		case  89: return spriteAssemblerHash.get("background1211_index");
		case  90: return spriteAssemblerHash.get("background2211_index");
		case  91: return spriteAssemblerHash.get("background3211_index");
		case  92: return spriteAssemblerHash.get("background0311_index");
		case  93: return spriteAssemblerHash.get("background1311_index");
		case  94: return spriteAssemblerHash.get("background2311_index");
		case  95: return spriteAssemblerHash.get("background3311_index");
		case  96: return spriteAssemblerHash.get("background0021_index");
		case  97: return spriteAssemblerHash.get("background1021_index");
		case  98: return spriteAssemblerHash.get("background2021_index");
		case  99: return spriteAssemblerHash.get("background3021_index");
		case 100: return spriteAssemblerHash.get("background0121_index");
		case 101: return spriteAssemblerHash.get("background1121_index");
		case 102: return spriteAssemblerHash.get("background2121_index");
		case 103: return spriteAssemblerHash.get("background3121_index");
		case 104: return spriteAssemblerHash.get("background0221_index");
		case 105: return spriteAssemblerHash.get("background1221_index");
		case 106: return spriteAssemblerHash.get("background2221_index");
		case 107: return spriteAssemblerHash.get("background3221_index");
		case 108: return spriteAssemblerHash.get("background0321_index");
		case 109: return spriteAssemblerHash.get("background1321_index");
		case 110: return spriteAssemblerHash.get("background2321_index");
		case 111: return spriteAssemblerHash.get("background3321_index");
		case 112: return spriteAssemblerHash.get("background0031_index");
		case 113: return spriteAssemblerHash.get("background1031_index");
		case 114: return spriteAssemblerHash.get("background2031_index");
		case 115: return spriteAssemblerHash.get("background3031_index");
		case 116: return spriteAssemblerHash.get("background0131_index");
		case 117: return spriteAssemblerHash.get("background1131_index");
		case 118: return spriteAssemblerHash.get("background2131_index");
		case 119: return spriteAssemblerHash.get("background3131_index");
		case 120: return spriteAssemblerHash.get("background0231_index");
		case 121: return spriteAssemblerHash.get("background1231_index");
		case 122: return spriteAssemblerHash.get("background2231_index");
		case 123: return spriteAssemblerHash.get("background3231_index");
		case 124: return spriteAssemblerHash.get("background0331_index");
		case 125: return spriteAssemblerHash.get("background1331_index");
		case 126: return spriteAssemblerHash.get("background2331_index");
		case 127: return spriteAssemblerHash.get("background3331_index");
		case 128: return spriteAssemblerHash.get("background0002_index");
		case 129: return spriteAssemblerHash.get("background1002_index");
		case 130: return spriteAssemblerHash.get("background2002_index");
		case 131: return spriteAssemblerHash.get("background3002_index");
		case 132: return spriteAssemblerHash.get("background0102_index");
		case 133: return spriteAssemblerHash.get("background1102_index");
		case 134: return spriteAssemblerHash.get("background2102_index");
		case 135: return spriteAssemblerHash.get("background3102_index");
		case 136: return spriteAssemblerHash.get("background0202_index");
		case 137: return spriteAssemblerHash.get("background1202_index");
		case 138: return spriteAssemblerHash.get("background2202_index");
		case 139: return spriteAssemblerHash.get("background3202_index");
		case 140: return spriteAssemblerHash.get("background0302_index");
		case 141: return spriteAssemblerHash.get("background1302_index");
		case 142: return spriteAssemblerHash.get("background2302_index");
		case 143: return spriteAssemblerHash.get("background3302_index");
		case 144: return spriteAssemblerHash.get("background0012_index");
		case 145: return spriteAssemblerHash.get("background1012_index");
		case 146: return spriteAssemblerHash.get("background2012_index");
		case 147: return spriteAssemblerHash.get("background3012_index");
		case 148: return spriteAssemblerHash.get("background0112_index");
		case 149: return spriteAssemblerHash.get("background1112_index");
		case 150: return spriteAssemblerHash.get("background2112_index");
		case 151: return spriteAssemblerHash.get("background3112_index");
		case 152: return spriteAssemblerHash.get("background0212_index");
		case 153: return spriteAssemblerHash.get("background1212_index");
		case 154: return spriteAssemblerHash.get("background2212_index");
		case 155: return spriteAssemblerHash.get("background3212_index");
		case 156: return spriteAssemblerHash.get("background0312_index");
		case 157: return spriteAssemblerHash.get("background1312_index");
		case 158: return spriteAssemblerHash.get("background2312_index");
		case 159: return spriteAssemblerHash.get("background3312_index");
		case 160: return spriteAssemblerHash.get("background0022_index");
		case 161: return spriteAssemblerHash.get("background1022_index");
		case 162: return spriteAssemblerHash.get("background2022_index");
		case 163: return spriteAssemblerHash.get("background3022_index");
		case 164: return spriteAssemblerHash.get("background0122_index");
		case 165: return spriteAssemblerHash.get("background1122_index");
		case 166: return spriteAssemblerHash.get("background2122_index");
		case 167: return spriteAssemblerHash.get("background3122_index");
		case 168: return spriteAssemblerHash.get("background0222_index");
		case 169: return spriteAssemblerHash.get("background1222_index");
		case 170: return spriteAssemblerHash.get("background2222_index");
		case 171: return spriteAssemblerHash.get("background3222_index");
		case 172: return spriteAssemblerHash.get("background0322_index");
		case 173: return spriteAssemblerHash.get("background1322_index");
		case 174: return spriteAssemblerHash.get("background2322_index");
		case 175: return spriteAssemblerHash.get("background3322_index");
		case 176: return spriteAssemblerHash.get("background0032_index");
		case 177: return spriteAssemblerHash.get("background1032_index");
		case 178: return spriteAssemblerHash.get("background2032_index");
		case 179: return spriteAssemblerHash.get("background3032_index");
		case 180: return spriteAssemblerHash.get("background0132_index");
		case 181: return spriteAssemblerHash.get("background1132_index");
		case 182: return spriteAssemblerHash.get("background2132_index");
		case 183: return spriteAssemblerHash.get("background3132_index");
		case 184: return spriteAssemblerHash.get("background0232_index");
		case 185: return spriteAssemblerHash.get("background1232_index");
		case 186: return spriteAssemblerHash.get("background2232_index");
		case 187: return spriteAssemblerHash.get("background3232_index");
		case 188: return spriteAssemblerHash.get("background0332_index");
		case 189: return spriteAssemblerHash.get("background1332_index");
		case 190: return spriteAssemblerHash.get("background2332_index");
		case 191: return spriteAssemblerHash.get("background3332_index");
		case 192: return spriteAssemblerHash.get("background0003_index");
		case 193: return spriteAssemblerHash.get("background1003_index");
		case 194: return spriteAssemblerHash.get("background2003_index");
		case 195: return spriteAssemblerHash.get("background3003_index");
		case 196: return spriteAssemblerHash.get("background0103_index");
		case 197: return spriteAssemblerHash.get("background1103_index");
		case 198: return spriteAssemblerHash.get("background2103_index");
		case 199: return spriteAssemblerHash.get("background3103_index");
		case 200: return spriteAssemblerHash.get("background0203_index");
		case 201: return spriteAssemblerHash.get("background1203_index");
		case 202: return spriteAssemblerHash.get("background2203_index");
		case 203: return spriteAssemblerHash.get("background3203_index");
		case 204: return spriteAssemblerHash.get("background0303_index");
		case 205: return spriteAssemblerHash.get("background1303_index");
		case 206: return spriteAssemblerHash.get("background2303_index");
		case 207: return spriteAssemblerHash.get("background3303_index");
		case 208: return spriteAssemblerHash.get("background0013_index");
		case 209: return spriteAssemblerHash.get("background1013_index");
		case 210: return spriteAssemblerHash.get("background2013_index");
		case 211: return spriteAssemblerHash.get("background3013_index");
		case 212: return spriteAssemblerHash.get("background0113_index");
		case 213: return spriteAssemblerHash.get("background1113_index");
		case 214: return spriteAssemblerHash.get("background2113_index");
		case 215: return spriteAssemblerHash.get("background3113_index");
		case 216: return spriteAssemblerHash.get("background0213_index");
		case 217: return spriteAssemblerHash.get("background1213_index");
		case 218: return spriteAssemblerHash.get("background2213_index");
		case 219: return spriteAssemblerHash.get("background3213_index");
		case 220: return spriteAssemblerHash.get("background0313_index");
		case 221: return spriteAssemblerHash.get("background1313_index");
		case 222: return spriteAssemblerHash.get("background2313_index");
		case 223: return spriteAssemblerHash.get("background3313_index");
		case 224: return spriteAssemblerHash.get("background0023_index");
		case 225: return spriteAssemblerHash.get("background1023_index");
		case 226: return spriteAssemblerHash.get("background2023_index");
		case 227: return spriteAssemblerHash.get("background3023_index");
		case 228: return spriteAssemblerHash.get("background0123_index");
		case 229: return spriteAssemblerHash.get("background1123_index");
		case 230: return spriteAssemblerHash.get("background2123_index");
		case 231: return spriteAssemblerHash.get("background3123_index");
		case 232: return spriteAssemblerHash.get("background0223_index");
		case 233: return spriteAssemblerHash.get("background1223_index");
		case 234: return spriteAssemblerHash.get("background2223_index");
		case 235: return spriteAssemblerHash.get("background3223_index");
		case 236: return spriteAssemblerHash.get("background0323_index");
		case 237: return spriteAssemblerHash.get("background1323_index");
		case 238: return spriteAssemblerHash.get("background2323_index");
		case 239: return spriteAssemblerHash.get("background3323_index");
		case 240: return spriteAssemblerHash.get("background0033_index");
		case 241: return spriteAssemblerHash.get("background1033_index");
		case 242: return spriteAssemblerHash.get("background2033_index");
		case 243: return spriteAssemblerHash.get("background3033_index");
		case 244: return spriteAssemblerHash.get("background0133_index");
		case 245: return spriteAssemblerHash.get("background1133_index");
		case 246: return spriteAssemblerHash.get("background2133_index");
		case 247: return spriteAssemblerHash.get("background3133_index");
		case 248: return spriteAssemblerHash.get("background0233_index");
		case 249: return spriteAssemblerHash.get("background1233_index");
		case 250: return spriteAssemblerHash.get("background2233_index");
		case 251: return spriteAssemblerHash.get("background3233_index");
		case 252: return spriteAssemblerHash.get("background0333_index");
		case 253: return spriteAssemblerHash.get("background1333_index");
		case 254: return spriteAssemblerHash.get("background2333_index");
		case 255: return spriteAssemblerHash.get("background3333_index");
		default: return 0;
		}
	}
}
