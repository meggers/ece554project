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
	import java.awt.geom.AffineTransform;
	import java.awt.image.AffineTransformOp;
	import java.awt.image.BufferedImage;
	import java.io.File;
	import java.io.IOException;

	import javax.imageio.IIOException;
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
	  private int[] backgroundTile = new int[1024];
	  private int[] backgroundAttribute = new int[1024];
	  
		int DISPLAY_LOGIC_WIDTH = 256;
		int DISPLAY_LOGIC_HEIGHT = 256;
		int DISPLAY_LOGIC_IMAGE_DIMENSION = 8;
		int DISPLAY_LOGIC_UNIT_SIZE = 4;
		BufferedImage[][] groundVisual = new BufferedImage[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION];
		int[][] groundData = new int[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE];
		BufferedImage[][][][] background = new BufferedImage[4][4][4][4];

		int p1x;
		int p1y;
		int p2x;
		int p2y;

		//char[] prevDirections = {'d', 'j'};
		char[] directions = {'d', 'j'};
		char[] nextDirections = {'d', 'j'};

	
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
				Thread.sleep(1000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void readBackground() {
		int backgroundPermutation = 4;
		for (int i = 0; i < backgroundPermutation; ++i) {
			for (int j = 0; j < backgroundPermutation; ++j) {
				for (int k = 0; k < backgroundPermutation; ++k) {
					for (int l = 0; l < backgroundPermutation; ++l) {
						try {
							background[i][j][k][l] = ImageIO.read(new File("images/background/background" + i + j + k + l + ".png"));
						} catch (IIOException E) {
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
	
	public void start() throws IOException {
		JFrame jFrame = new JFrame("Sample PPU Simulator");
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
		
		// all
		for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++x) {
			for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++y) {
				groundData[x][y] = 0;
			}
		}
		//BufferedImage backgroundBufferedImage = ImageIO.read(new File("images/background/white.png"));
		BufferedImage backgroundBufferedImage = ImageIO.read(new File("images/background/background0000.png"));
		for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++x) {
			for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++y) {
				groundVisual[x][y] = backgroundBufferedImage;
			}
		}
		
		// top
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][0] = 3;
		}
		BufferedImage topBufferedImage = ImageIO.read(new File("images/background/background3300.png"));
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[i][0] = topBufferedImage;
		}
		
		// left
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[0][i] = 3;
		}
		BufferedImage leftBufferedImage = ImageIO.read(new File("images/background/background3030.png"));
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[0][i] = leftBufferedImage;
		}
		
		// right
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE - 1][i] = 3;
		}
		BufferedImage rightBufferedImage = ImageIO.read(new File("images/background/background0303.png"));
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][i] = rightBufferedImage;
		}
		
		// bottom
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE - 1] = 3;
		}
		BufferedImage bottomBufferedImage = ImageIO.read(new File("images/background/background0033.png"));
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = bottomBufferedImage;
		}

		// need to recover the corners since images overwrite each other
		groundVisual[0][0] = ImageIO.read(new File("images/background/background3330.png"));
		groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = ImageIO.read(new File("images/background/background3303.png"));
		groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background3033.png"));
		groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background0333.png"));
		
		PPU ppu = new PPU();
		jFrame.add(ppu);
		jFrame.setSize(DISPLAY_LOGIC_WIDTH + 50, DISPLAY_LOGIC_HEIGHT + 50);
		jFrame.setVisible(true);
		
		KeyListener keyListener = new KeyListener() {
			@Override
			public void keyPressed(KeyEvent arg0) {
				char characterPressed = arg0.getKeyChar();
				if ("wasdijkl".contains("" + characterPressed)) {
					if (characterPressed == 'w' && directions[0] != 's'
							|| characterPressed == 'a' && directions[0] != 'd'
							|| characterPressed == 's' && directions[0] != 'w'
							|| characterPressed == 'd' && directions[0] != 'a') {
						nextDirections[0] = characterPressed;
					}
					if (characterPressed == 'i' && directions[1] != 'k'
							|| characterPressed == 'j' && directions[1] != 'l'
							|| characterPressed == 'k' && directions[1] != 'i'
							|| characterPressed == 'l' && directions[1] != 'j') {
						nextDirections[1] = characterPressed;
					}
				}
			}

			@Override
			public void keyReleased(KeyEvent arg0) {
			}

			@Override
			public void keyTyped(KeyEvent e) {
			}
		};
		
		jFrame.addKeyListener(keyListener);
		
		while(true) {
			Thread thread = new Thread(new TimerInterrupt());
			thread.start();
			try {
				thread.join();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			// start game tick
			
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

			// update background to leave trail
			groundData[p1x][p1y] = 1;
			int p1xVisual = p1x / 2;
			int p1yVisual = p1y / 2;
			groundData[p2x][p2y] = 2;
			int p2xVisual = p2x / 2;
			int p2yVisual = p2y / 2;

			groundVisual[p1xVisual][p1yVisual] = background[groundData[2 * p1xVisual][2 * p1yVisual]][groundData[2 * p1xVisual + 1][2 * p1yVisual]][groundData[2 * p1xVisual][2 * p1yVisual + 1]][groundData[2 * p1xVisual + 1][2 * p1yVisual + 1]];
			groundVisual[p2xVisual][p2yVisual] = background[groundData[2 * p2xVisual][2 * p2yVisual]][groundData[2 * p2xVisual + 1][2 * p2yVisual]][groundData[2 * p2xVisual][2 * p2yVisual + 1]][groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]];

			directions[0] = nextDirections[0];
			directions[1] = nextDirections[1];
			
			jFrame.repaint();
		}
	}
	
	class PPUSimulator implements Runnable {
		public void run() {
			readBackground();
			System.out.println("done reading background");
			try {
				start();
			} catch (Exception e) {
				e.printStackTrace();
			}
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
			
			try {
				BufferedImage bikeBufferedImage0 = ImageIO.read(new File("images/foreground/bike0.png"));
				BufferedImage bikeBufferedImage1 = ImageIO.read(new File("images/foreground/bike1.png"));
				BufferedImage bikeBufferedImage2 = ImageIO.read(new File("images/foreground/bike2.png"));

				int p1rotationCount = 0;
				int p1xOffset = 0;
				int p1yOffset = 1;
				int p2rotationCount = 0;
				int p2xOffset = 0;
				int p2yOffset = 1;
				switch (directions[0]) {
				case 'a': 
					p1rotationCount = 3;
					p1xOffset = 1;
					p1yOffset = 0;
					break;
				case 's': 
					p1rotationCount = 2;
					p1xOffset = 0;
					p1yOffset = -1;
					break;
				case 'd': 
					p1rotationCount = 1;
					p1xOffset = -1;
					p1yOffset = 0;
					break;
				}
				
				switch (directions[1]) {
				case 'j': 
					p2rotationCount = 3;
					p2xOffset = 1;
					p2yOffset = 0;
					break;
				case 'k': 
					p2rotationCount = 2; 
					p2xOffset = 0;
					p2yOffset = -1;
					break;
				case 'l': 
					p2rotationCount = 1;
					p2xOffset = -1;
					p2yOffset = 0;
					break;
				}
				
				AffineTransform affineTransform;
				AffineTransformOp affineTransformOp;
				
				affineTransform = new AffineTransform();
				affineTransform.rotate(Math.toRadians(90) * p1rotationCount, DISPLAY_LOGIC_IMAGE_DIMENSION / 2, DISPLAY_LOGIC_IMAGE_DIMENSION / 2);
				affineTransformOp = new AffineTransformOp(affineTransform, AffineTransformOp.TYPE_BILINEAR);
				int player1ColorPalette = 2;
				BufferedImage player1BikeBufferedImage0 = setColorPalette(affineTransformOp.filter(bikeBufferedImage0, null), player1ColorPalette);
				BufferedImage player1BikeBufferedImage1 = setColorPalette(affineTransformOp.filter(bikeBufferedImage1, null), player1ColorPalette);
				BufferedImage player1BikeBufferedImage2 = setColorPalette(affineTransformOp.filter(bikeBufferedImage2, null), player1ColorPalette);
				
				affineTransform = new AffineTransform();
				affineTransform.rotate(Math.toRadians(90) * p2rotationCount, DISPLAY_LOGIC_IMAGE_DIMENSION / 2, DISPLAY_LOGIC_IMAGE_DIMENSION / 2);
				affineTransformOp = new AffineTransformOp(affineTransform, AffineTransformOp.TYPE_BILINEAR);
				BufferedImage player2BikeBufferedImage0 = affineTransformOp.filter(bikeBufferedImage0, null);
				BufferedImage player2BikeBufferedImage1 = affineTransformOp.filter(bikeBufferedImage1, null);
				BufferedImage player2BikeBufferedImage2 = affineTransformOp.filter(bikeBufferedImage2, null);
				
				graphics.drawImage(player1BikeBufferedImage0, p1x * DISPLAY_LOGIC_UNIT_SIZE - 1 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p1y * DISPLAY_LOGIC_UNIT_SIZE - 1 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player1BikeBufferedImage1, p1x * DISPLAY_LOGIC_UNIT_SIZE + 0 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p1y * DISPLAY_LOGIC_UNIT_SIZE + 0 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player1BikeBufferedImage2, p1x * DISPLAY_LOGIC_UNIT_SIZE + 1 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p1y * DISPLAY_LOGIC_UNIT_SIZE + 1 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player2BikeBufferedImage0, p2x * DISPLAY_LOGIC_UNIT_SIZE - 1 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p2y * DISPLAY_LOGIC_UNIT_SIZE - 1 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player2BikeBufferedImage1, p2x * DISPLAY_LOGIC_UNIT_SIZE + 0 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p2y * DISPLAY_LOGIC_UNIT_SIZE + 0 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player2BikeBufferedImage2, p2x * DISPLAY_LOGIC_UNIT_SIZE + 1 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p2y * DISPLAY_LOGIC_UNIT_SIZE + 1 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public BufferedImage setColorPalette(BufferedImage inputBufferedImage, int colorPaletteIndex) {
		
		// colorPaletteIndex0 = RGB
		// colorPaletteIndex1 = CMY
		// colorPaletteIndex2 = BRG
		// colorPaletteIndex3 = BBB
		
		int[] colors = { Color.RED.getRGB(), Color.GREEN.getRGB(), Color.BLUE.getRGB() };
		
		switch (colorPaletteIndex) {
		case 1: 
			colors[0] = Color.CYAN.getRGB();
			colors[1] = Color.MAGENTA.getRGB();
			colors[2] = Color.YELLOW.getRGB();
			break;
		case 2: 
			colors[0] = Color.GREEN.getRGB();
			colors[1] = Color.RED.getRGB();
			colors[2] = Color.BLUE.getRGB();
			break;
		case 3: 
			colors[0] = Color.BLUE.getRGB();
			colors[1] = Color.BLUE.getRGB();
			colors[2] = Color.BLUE.getRGB();
			break;
		}
		for (int x = 0; x < inputBufferedImage.getWidth(); ++x) {
			for (int y = 0; y < inputBufferedImage.getHeight(); ++y) {
				if (inputBufferedImage.getRGB(x, y) == Color.BLACK.getRGB()) {
				} else if (inputBufferedImage.getRGB(x, y) == Color.RED.getRGB()) {
					inputBufferedImage.setRGB(x, y, colors[0]);
				} else if (inputBufferedImage.getRGB(x, y) == Color.GREEN.getRGB()) {
					inputBufferedImage.setRGB(x, y, colors[1]);
				} else if (inputBufferedImage.getRGB(x, y) == Color.BLUE.getRGB()) {
					inputBufferedImage.setRGB(x, y, colors[2]);
				}
			}
		}
		return inputBufferedImage;
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
            	 "Null operation : machine code is all zeroes",
                BasicInstructionFormat.R_FORMAT,
                "111111 11111 11111 11111 11111 111111",
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
            	 "Bitwise AND immediate : Set $t1 to bitwise AND of $t2 and zero-extended 16-bit immediate",
                BasicInstructionFormat.I_FORMAT,
                "100101 fffff sssss tttttttttttttttt",
                new SimulationCode()
               {
                   public void simulate(ProgramStatement statement) throws ProcessingException
                  {
                     int[] operands = statement.getOperands();
					 int and = RegisterFile.getValue(operands[1]) & (operands[2] & 0x0000FFFF);
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
                     RegisterFile.updateRegister(operands[0], operands[1]);
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
                            RegisterFile.getValue(operands[2]) + operands[1]));
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
                            RegisterFile.getValue(operands[2]) + operands[1],
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
                     processBranch(operands[0]);
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
                        processBranch(operands[0]);
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
                        processBranch(operands[0]);
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
                        processBranch(operands[2]);
                     }
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
							RegisterFile.getValue(29),			// Set the top of the stack with
							RegisterFile.getProgramCounter());		// what's in the PC + 1 
						RegisterFile.updateRegister(29, RegisterFile.getValue(29) + 1);
					} 
                    catch (AddressErrorException e)
                    {
                        throw new ProcessingException(statement, e);
                    }
                     processJump(
                        ((RegisterFile.getProgramCounter() & 0xF0000000)
                                | (operands[0] << 2)));            
                  }
               }));
			instructionList.add(
                new BasicInstruction("return", 
            	 "Return from a previous function call",
            	 BasicInstructionFormat.J_FORMAT,
                "000101 ffffffffffffffffffffffffff",
                new SimulationCode()
               {
                   public void simulate(ProgramStatement statement) throws ProcessingException
                  {
                     int[] operands = statement.getOperands();
					 
					RegisterFile.updateRegister(29, RegisterFile.getValue(29) - 1);
					try
					{
						processJump(Globals.memory.getWord(RegisterFile.getValue(29)));
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
				"001110 ffffffffffffffffffffffffff",
				
				new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						RegisterFile.updateRegister(29, RegisterFile.getValue(29) + 4);
						try
						{
							Globals.memory.setWord(
								RegisterFile.getValue(29),			
								RegisterFile.getValue(operands[0]));		
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
					}
				
			}));
			instructionList.add(
				new BasicInstruction("pop $t0",
				"Pop a value from the stack into a register",
				BasicInstructionFormat.I_FORMAT,
				"001010 ffffffffffffffffffffffffff",
				
				new SimulationCode()
				{
					public void simulate(ProgramStatement statement) throws ProcessingException
					{
						int[] operands = statement.getOperands();
						
						try
						{
							RegisterFile.updateRegister(operands[0],
							Globals.memory.getWord(
								RegisterFile.getValue(29)));		// what's in the PC
						} 
						catch (AddressErrorException e)
						{
							throw new ProcessingException(statement, e);
						}
						
						RegisterFile.updateRegister(29, RegisterFile.getValue(29) - 4);
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
                     Coprocessor1.updateRegister(RegisterFile.getValue(operands[0]) & 0x0000003F, 0xFFFFFFFF);
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
					 int sslX = RegisterFile.getValue(operands[1]) & 0x0000FF00;
					 // int mask = 0x00FFFF00; mask to keep sprite tile and attribute
					 Coprocessor1.updateRegister(OAMindex,
					  ((Coprocessor1.getValue(OAMindex) & 0x00FFFF00) + (sslX << 16) + sslY)); // shift 16 more since it already shifted by 8
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
   }

