import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class ECE554VisualSimTronsistorISA {

	HashMap<String, Integer> spriteAssemblerHash;
	BufferedImage[] spritePatternTable = new BufferedImage[256]; 
	BufferedImage[] backgroundPatternTable = new BufferedImage[256]; 
	int DISPLAY_LOGIC_WIDTH = 256;
	int DISPLAY_LOGIC_HEIGHT = 256;
	int DISPLAY_LOGIC_IMAGE_DIMENSION = 8;
	int DISPLAY_LOGIC_UNIT_SIZE = 4;
	BufferedImage[][] groundVisual = new BufferedImage[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION];
	int[][] groundData = new int[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE];
	// commented out, use backgroundPatternTable for TronMIPSter; BufferedImage[][][][] background = new BufferedImage[4][4][4][4];

	int p1x;
	int p1y;
	int p2x;
	int p2y;

	//char[] prevDirections = {'d', 'j'};
	char[] directions = {'d', 'j'};
	char[] nextDirections = {'d', 'j'};

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
								spritePatternTable[Integer.parseInt(lineTokens[1]) + height*bufferedImage.getWidth() + width] = bufferedImageOutput;
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
								backgroundPatternTable[Integer.parseInt(lineTokens[1]) + height*bufferedImage.getWidth() + width] = bufferedImageOutput;
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

		/*
		System.out.println("p1x = " + p1x);
		System.out.println("p2x = " + p2x);
		System.out.println("p1y = " + p1y);
		System.out.println("p2y = " + p2y);
		System.out.println("DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE = " + (DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE));
		 */

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
		for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++x) {
			for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++y) {
				groundVisual[x][y] = backgroundPatternTable[spriteAssemblerHash.get("background0000_index")];
			}
		}

		// top
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][0] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[i][0] = backgroundPatternTable[spriteAssemblerHash.get("background3300_index")];
		}

		// left
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[0][i] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[0][i] = backgroundPatternTable[spriteAssemblerHash.get("background3030_index")];
		}

		// right
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE - 1][i] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][i] = backgroundPatternTable[spriteAssemblerHash.get("background0303_index")];
		}

		// bottom
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++i) {
			groundData[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE - 1] = 3;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++i) {
			groundVisual[i][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = backgroundPatternTable[spriteAssemblerHash.get("background0033_index")];
		}

		// need to recover the corners since images overwrite each other
		// groundVisual[0][0] = ImageIO.read(new File("images/background/background3330.png"));
		groundVisual[0][0] = backgroundPatternTable[spriteAssemblerHash.get("background3330_index")];
		// groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = ImageIO.read(new File("images/background/background3303.png"));
		groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][0] = backgroundPatternTable[spriteAssemblerHash.get("background3303_index")];
		// groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background3033.png"));
		groundVisual[0][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = backgroundPatternTable[spriteAssemblerHash.get("background3033_index")];
		// groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = ImageIO.read(new File("images/background/background0333.png"));
		groundVisual[DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION - 1][DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION - 1] = backgroundPatternTable[spriteAssemblerHash.get("background0333_index")];

		PPU ppu = new PPU();
		jFrame.add(ppu);
		jFrame.setSize(DISPLAY_LOGIC_WIDTH + 50, DISPLAY_LOGIC_HEIGHT + 50);
		//jFrame.setSize(DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_UNIT_SIZE+20, DISPLAY_LOGIC_HEIGHT * DISPLAY_LOGIC_UNIT_SIZE+40);
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
			groundVisual[p1xVisual][p1yVisual] = backgroundPatternTable[p1LocationVisual];
			//groundVisual[p2xVisual][p2yVisual] = background[groundData[2 * p2xVisual][2 * p2yVisual]][groundData[2 * p2xVisual + 1][2 * p2yVisual]][groundData[2 * p2xVisual][2 * p2yVisual + 1]][groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]];
			int p2LocationVisual = getVisualIndex((groundData[2 * p2xVisual][2 * p2yVisual]) + 4*(groundData[2 * p2xVisual + 1][2 * p2yVisual]) + 16*(groundData[2 * p2xVisual][2 * p2yVisual + 1]) + 64*(groundData[2 * p2xVisual + 1][2 * p2yVisual + 1]));
			groundVisual[p2xVisual][p2yVisual] = backgroundPatternTable[p2LocationVisual];

			directions[0] = nextDirections[0];
			directions[1] = nextDirections[1];

			jFrame.repaint();
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
//				BufferedImage bikeBufferedImage0 = ImageIO.read(new File("images/foreground/bike0.png"));
//				BufferedImage bikeBufferedImage1 = ImageIO.read(new File("images/foreground/bike1.png"));
//				BufferedImage bikeBufferedImage2 = ImageIO.read(new File("images/foreground/bike2.png"));

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


				//for (int i = 0; i < player2BikeBufferedImage.getHeight(); i++) {
				//	player2BikeBufferedImage.setRGB(i, i, 65280);
				//	//player2BikeBufferedImage.setRGB(i+1, i+1, 255);
				//}

				//System.out.println("bikeHeight = " + bikeHeight + "; bikeWidth = " + bikeWidth);
				graphics.drawImage(player1BikeBufferedImage0, p1x * DISPLAY_LOGIC_UNIT_SIZE - 1 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p1y * DISPLAY_LOGIC_UNIT_SIZE - 1 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player1BikeBufferedImage1, p1x * DISPLAY_LOGIC_UNIT_SIZE + 0 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p1y * DISPLAY_LOGIC_UNIT_SIZE + 0 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player1BikeBufferedImage2, p1x * DISPLAY_LOGIC_UNIT_SIZE + 1 * p1xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p1y * DISPLAY_LOGIC_UNIT_SIZE + 1 * p1yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player2BikeBufferedImage0, p2x * DISPLAY_LOGIC_UNIT_SIZE - 1 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p2y * DISPLAY_LOGIC_UNIT_SIZE - 1 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player2BikeBufferedImage1, p2x * DISPLAY_LOGIC_UNIT_SIZE + 0 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p2y * DISPLAY_LOGIC_UNIT_SIZE + 0 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				graphics.drawImage(player2BikeBufferedImage2, p2x * DISPLAY_LOGIC_UNIT_SIZE + 1 * p2xOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, p2y * DISPLAY_LOGIC_UNIT_SIZE + 1 * p2yOffset * DISPLAY_LOGIC_IMAGE_DIMENSION - 2, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);

				//graphics.drawImage(player2BikeBufferedImage, p2x - maxDimension / 2, p2y - maxDimension / 2, maxDimension, maxDimension, null);

				//graphics.drawImage(bikeBufferedImage, p1x - bikeBufferedImage.getWidth() / 2, p1y - bikeBufferedImage.getHeight() / 2, bikeBufferedImage.getWidth(), bikeBufferedImage.getHeight(), null);
				//graphics.drawImage(bikeBufferedImage, p2x * DISPLAY_LOGIC_UNIT_SIZE, p2y * DISPLAY_LOGIC_UNIT_SIZE, 48, 16, null);
			} catch (IOException e) {
				e.printStackTrace();
			}

			//			graphics.fillRect(25, 25, 2, 2);
			//			graphics.fillRect(50, 50, 2, 2);
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

}
