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

public class ECE554VisualSimTronsistorISA {

	HashMap<String, Integer> spriteAssemblerHash; // will be handled by the assembler
	BufferedImage[] spritePatternTable = new BufferedImage[256]; // index into sprite visual data, use assembler for index
	BufferedImage[] backgroundPatternTable = new BufferedImage[256]; // index into background visual data, use assembler for index
	
	int DISPLAY_LOGIC_WIDTH = 256;
	int DISPLAY_LOGIC_HEIGHT = 256;
	int DISPLAY_LOGIC_IMAGE_DIMENSION = 8;
	int DISPLAY_LOGIC_UNIT_SIZE = 4;
	BufferedImage[][] groundVisual = new BufferedImage[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION];
	SpriteData[] spriteData = new SpriteData[64];
	
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
	
	public static void main(String s[]) throws IOException {
		ECE554VisualSimTronsistorISA ECE554VisualSimConstructor = new ECE554VisualSimTronsistorISA();
		ECE554VisualSimConstructor.readBackground();
		while (true) {
			ECE554VisualSimConstructor.start();
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
		// commented out, use backgroundPatternTable for TronMIPSter; 
		//		int backgroundPermutation = 4;
		//		for (int i = 0; i < backgroundPermutation; ++i) {
		//			for (int j = 0; j < backgroundPermutation; ++j) {
		//				for (int k = 0; k < backgroundPermutation; ++k) {
		//					for (int l = 0; l < backgroundPermutation; ++l) {
		//						try {
		//							background[i][j][k][l] = ImageIO.read(new File("images/background/background" + i + j + k + l + ".png"));
		//						} catch (IIOException E) {
		//						} catch (IOException e) {
		//							e.printStackTrace();
		//						}
		//					}
		//				}
		//			}
		//		}
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
				groundVisual[x][y] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0000_index")], 0);
			}
		}

		// top
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][0] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[i][0] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3300_index")], 0);
		}

		// left
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[0][i] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[0][i] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3030_index")], 0);
		}

		// right
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE - 1][i] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][i] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0303_index")], 0);
		}

		// bottom
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE - 1] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0033_index")], 0);
		}

		// need to recover the corners since images overwrite each other
		// groundVisual[0][0] = ImageIO.read(new File("images/background/background3330.png"));
		groundVisual[0][0] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3330_index")], 0);
		// groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = ImageIO.read(new File("images/background/background3303.png"));
		groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3303_index")], 0);
		// groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background3033.png"));
		groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background3033_index")], 0);
		// groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background0333.png"));
		groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = setColorPalette(backgroundPatternTable[spriteAssemblerHash.get("background0333_index")], 0);

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
				if ("WwAaSsDdIiJjKkLl".contains("" + characterPressed)) {
					characterPressed = ("" + characterPressed).toLowerCase().charAt(0);
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

		// set color palettes
		int player1ColorPalette = 2;
		int player2ColorPalette = 0;
		spriteData[0].setColorPaletteIndex(player1ColorPalette);
		spriteData[1].setColorPaletteIndex(player1ColorPalette);
		spriteData[2].setColorPaletteIndex(player1ColorPalette);
		spriteData[3].setColorPaletteIndex(player2ColorPalette);
		spriteData[4].setColorPaletteIndex(player2ColorPalette);
		spriteData[5].setColorPaletteIndex(player2ColorPalette);
		
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
			//			
			//			// update background to leave trail
			groundData[p1x][p1y] = 1;
			int p1xVisual = p1x / 2;
			int p1yVisual = p1y / 2;
			groundData[p2x][p2y] = 2;
			int p2xVisual = p2x / 2;
			int p2yVisual = p2y / 2;

			//		System.out.println("before = " + p1x + "; after = " + p1xVisual);
			//		System.out.println("pulling from background[groundData[" + p1xVisual + "][" + p1yVisual + "]][groundData[][]][groundData[][]][groundData[][]]");
			//		System.out.println("which equals to background[" + groundData[p1xVisual][p1yVisual] + "][" + groundData[p1xVisual + 1][p1yVisual] + "][" + groundData[p1xVisual][p1yVisual + 1] + "][" + groundData[p1xVisual + 1][p1yVisual + 1] + "]");

			//groundVisual[p1xVisual][p1yVisual] = background[groundData[2 * p1xVisual][2 * p1yVisual]][groundData[2 * p1xVisual + 1][2 * p1yVisual]][groundData[2 * p1xVisual][2 * p1yVisual + 1]][groundData[2 * p1xVisual + 1][2 * p1yVisual + 1]];
			int p1LocationVisual = getVisualIndex((groundData[2 * p1xVisual][2 * p1yVisual]) + 4*(groundData[2 * p1xVisual + 1][2 * p1yVisual]) + 16*(groundData[2 * p1xVisual][2 * p1yVisual + 1]) + 64*(groundData[2 * p1xVisual + 1][2 * p1yVisual + 1]));
			groundVisual[p1xVisual][p1yVisual] = setColorPalette(backgroundPatternTable[p1LocationVisual], 0);
			//groundVisual[p2xVisual][p2yVisual] = background[groundData[2 * p2xVisual][2 * p2yVisual]][groundData[2 * p2xVisual + 1][2 * p2yVisual]][groundData[2 * p2xVisual][2 * p2yVisual + 1]][groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]];
			int p2LocationVisual = getVisualIndex((groundData[2 * p2xVisual][2 * p2yVisual]) + 4*(groundData[2 * p2xVisual + 1][2 * p2yVisual]) + 16*(groundData[2 * p2xVisual][2 * p2yVisual + 1]) + 64*(groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]));
			groundVisual[p2xVisual][p2yVisual] = setColorPalette(backgroundPatternTable[p2LocationVisual], 0);

			directions[0] = nextDirections[0];
			directions[1] = nextDirections[1];


			int p1startingTileNumber = spriteAssemblerHash.get("light_bike_small_index"); // index into spritePatternTable
			int p1attribute = 0;	// determines rotation
			int p1xOffset = 0;		// determines where to draw head and tail
			int p1yOffset = 1;		// determines where to draw head and tail
			int p2startingTileNumber = spriteAssemblerHash.get("light_bike_small_index"); // index into spritePatternTable
			int p2attribute = 0;	// determines rotation
			int p2xOffset = 0;		// determines where to draw head and tail
			int p2yOffset = 1;		// determines where to draw head and tail
			switch (directions[0]) {
			case 'a': 
				p1startingTileNumber = spriteAssemblerHash.get("light_bike_small_rotated_index");
				p1attribute = 1;
				p1xOffset = 1;
				p1yOffset = 0;
				break;
			case 's': 
				p1attribute = 2;
				p1xOffset = 0;
				p1yOffset = -1;
				break;
			case 'd': 
				p1startingTileNumber = spriteAssemblerHash.get("light_bike_small_rotated_index");
				p1attribute = 3;
				p1xOffset = -1;
				p1yOffset = 0;
				break;
			}

			switch (directions[1]) {
			case 'j': 
				p2startingTileNumber = spriteAssemblerHash.get("light_bike_small_rotated_index");
				p2attribute = 1;
				p2xOffset = 1;
				p2yOffset = 0;
				break;
			case 'k': 
				p2attribute = 2; 
				p2xOffset = 0;
				p2yOffset = -1;
				break;
			case 'l': 
				p2startingTileNumber = spriteAssemblerHash.get("light_bike_small_rotated_index");
				p2attribute = 3;
				p2xOffset = -1;
				p2yOffset = 0;
				break;
			}
			
			// load tile number
			spriteData[0].setBufferedImage(spritePatternTable[p1startingTileNumber + 0]);
			spriteData[1].setBufferedImage(spritePatternTable[p1startingTileNumber + 1]);
			spriteData[2].setBufferedImage(spritePatternTable[p1startingTileNumber + 2]);
			spriteData[3].setBufferedImage(spritePatternTable[p2startingTileNumber + 0]);
			spriteData[4].setBufferedImage(spritePatternTable[p2startingTileNumber + 1]);
			spriteData[5].setBufferedImage(spritePatternTable[p2startingTileNumber + 2]);
			
			// flip vertical
			spriteData[0].setFlipVertical(p1attribute == 2);
			spriteData[1].setFlipVertical(p1attribute == 2);
			spriteData[2].setFlipVertical(p1attribute == 2);
			spriteData[3].setFlipVertical(p2attribute == 2);
			spriteData[4].setFlipVertical(p2attribute == 2);
			spriteData[5].setFlipVertical(p2attribute == 2);
			
			// flip horizontal
			spriteData[0].setFlipHorizontal(p1attribute == 3);
			spriteData[1].setFlipHorizontal(p1attribute == 3);
			spriteData[2].setFlipHorizontal(p1attribute == 3);
			spriteData[3].setFlipHorizontal(p2attribute == 3);
			spriteData[4].setFlipHorizontal(p2attribute == 3);
			spriteData[5].setFlipHorizontal(p2attribute == 3);
			
			// set yLocation
			spriteData[0].setyPosition(p1y * DISPLAY_LOGIC_UNIT_SIZE - 1 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[1].setyPosition(p1y * DISPLAY_LOGIC_UNIT_SIZE + 0 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[2].setyPosition(p1y * DISPLAY_LOGIC_UNIT_SIZE + 1 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[3].setyPosition(p2y * DISPLAY_LOGIC_UNIT_SIZE - 1 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[4].setyPosition(p2y * DISPLAY_LOGIC_UNIT_SIZE + 0 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[5].setyPosition(p2y * DISPLAY_LOGIC_UNIT_SIZE + 1 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			
			// set xLocation
			spriteData[0].setxPosition(p1x * DISPLAY_LOGIC_UNIT_SIZE - 1 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[1].setxPosition(p1x * DISPLAY_LOGIC_UNIT_SIZE + 0 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[2].setxPosition(p1x * DISPLAY_LOGIC_UNIT_SIZE + 1 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[3].setxPosition(p2x * DISPLAY_LOGIC_UNIT_SIZE - 1 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[4].setxPosition(p2x * DISPLAY_LOGIC_UNIT_SIZE + 0 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);
			spriteData[5].setxPosition(p2x * DISPLAY_LOGIC_UNIT_SIZE + 1 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2);

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
				if (spriteData[spriteIndex].getyPosition() == 255) {
					continue;
				}
				graphics.drawImage(setColorPalette(setFlip(spriteData[spriteIndex].getBufferedImage(), spriteData[spriteIndex].isFlipVertical(), spriteData[spriteIndex].isFlipHorizontal()), spriteData[spriteIndex].getColorPaletteIndex()), spriteData[spriteIndex].getxPosition(), spriteData[spriteIndex].getyPosition(), DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
			}
		}
	}

	public BufferedImage setFlip(BufferedImage inputBufferedImage, boolean isFlipVertical, boolean isFlipHorizontal) {
		
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
				Thread.sleep(100);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
