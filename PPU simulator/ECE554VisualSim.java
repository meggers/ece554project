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

public class ECE554VisualSim {

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
	
	public static void main(String s[]) throws IOException {
		ECE554VisualSim ECE554VisualSimConstructor = new ECE554VisualSim();
		ECE554VisualSimConstructor.readBackground();
		while (true) {
			ECE554VisualSimConstructor.start();
		}
	}
	
	public void readBackground() throws IOException {
		int backgroundPermutation = 4;
		for (int i = 0; i < backgroundPermutation; ++i) {
			for (int j = 0; j < backgroundPermutation; ++j) {
				for (int k = 0; k < backgroundPermutation; ++k) {
					for (int l = 0; l < backgroundPermutation; ++l) {
						// background[i][j][k][l] = ImageIO.read(new File("images/background/white.png"));
						// System.out.println("got " + new File("images/background/background" + i + j + k + l + ".png").getAbsolutePath());
						try {
							background[i][j][k][l] = ImageIO.read(new File("images/background/background" + i + j + k + l + ".png"));
						} catch (IIOException E) {
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
		
		for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_UNIT_SIZE; ++x) {
			for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_UNIT_SIZE; ++y) {
				groundData[x][y] = 0;
			}
		}
		BufferedImage backgroundBufferedImage = ImageIO.read(new File("images/background/white.png"));
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
			
//			// check for collision
//			if (ground[p1y * DISPLAY_LOGIC_WIDTH + p1x] != 0) {
//				if (ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] != 0) {
//					System.out.println("tied");
//				} else {
//					System.out.println("player 2 wins");
//				}
//				jFrame.setVisible(false);
//				return;
//			} else {
//				if (ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] != 0) {
//					System.out.println("player 1 wins");
//					jFrame.setVisible(false);
//					return;
//				}
//			}
//			
//			// update background to leave trail
			groundData[p1x][p1y] = 1;
			int p1xVisual = p1x / 2;
			int p1yVisual = p1y / 2;

			System.out.println("before = " + p1x + "; after = " + p1xVisual);
			System.out.println("pulling from background[groundData[" + p1xVisual + "][" + p1yVisual + "]][groundData[][]][groundData[][]][groundData[][]]");
			System.out.println("which equals to background[" + groundData[p1xVisual][p1yVisual] + "][" + groundData[p1xVisual + 1][p1yVisual] + "][" + groundData[p1xVisual][p1yVisual + 1] + "][" + groundData[p1xVisual + 1][p1yVisual + 1] + "]");
			
			// groundVisual[p1xRounded][p1yRounded] = ImageIO.read(new File("images/background/background" + groundData[p1xRounded][p1yRounded] + groundData[p1xRounded + 1][p1yRounded] + groundData[p1xRounded][p1yRounded + 1] + groundData[p1xRounded + 1][p1yRounded + 1] + ".png"));
			// groundVisual[p1xRounded][p1yRounded] = background[groundData[p1xRounded][p1yRounded]][groundData[p1xRounded + 1][p1yRounded]][groundData[p1xRounded][p1yRounded + 1]][groundData[p1xRounded + 1][p1yRounded + 1]];
			groundVisual[p1xVisual][p1yVisual] = background[groundData[2 * p1xVisual][2 * p1yVisual]][groundData[2 * p1xVisual + 1][2 * p1yVisual]][groundData[2 * p1xVisual][2 * p1yVisual + 1]][groundData[2 * p1xVisual + 1][2 * p1yVisual + 1]];
//			ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] = 3;
			
			directions[0] = nextDirections[0];
			directions[1] = nextDirections[1];
			
			jFrame.repaint();
		}
	}
	

	public class PPU extends JPanel {
		public void paintComponent(Graphics graphics) {
			super.paintComponent(graphics);
			this.setBackground(Color.WHITE);

			try {
				BufferedImage bikeBufferedImage = ImageIO.read(new File("images/foreground/light_bike3.png"));
				BufferedImage bikeBufferedImage2 = ImageIO.read(new File("images/foreground/light_bike4.png"));
				
				//BufferedImage bikeBufferedImage = ImageIO.read(new File("images/duke_skateboard.jpg"));
				
				int maxDimension = Math.max(bikeBufferedImage.getWidth(), bikeBufferedImage.getHeight());
				
				int p1rotationCount = 0;
				int p2rotationCount = 0;
				switch (directions[0]) {
				case 'a': 
					p1rotationCount = 3;
					break;
				case 's': 
					p1rotationCount = 2; 
					break;
				case 'd': 
					p1rotationCount = 1;
					break;
				}
				
				switch (directions[1]) {
				case 'j': 
					p2rotationCount = 3;
					break;
				case 'k': 
					p2rotationCount = 2; 
					break;
				case 'l': 
					p2rotationCount = 1;
					break;
				}
				
				AffineTransform affineTransform = new AffineTransform();
				affineTransform.rotate(Math.toRadians(90) * p1rotationCount, maxDimension / 2, maxDimension / 2);
				AffineTransformOp op = new AffineTransformOp(affineTransform, AffineTransformOp.TYPE_BILINEAR);
				BufferedImage player1BikeBufferedImage = op.filter(bikeBufferedImage, null);
				
				affineTransform = new AffineTransform();
				affineTransform.rotate(Math.toRadians(90) * (p2rotationCount), maxDimension / 2, maxDimension / 2);
				op = new AffineTransformOp(affineTransform, AffineTransformOp.TYPE_BILINEAR);
				BufferedImage player2BikeBufferedImage = op.filter(bikeBufferedImage2, null);
				
				
				//for (int i = 0; i < player2BikeBufferedImage.getHeight(); i++) {
				//	player2BikeBufferedImage.setRGB(i, i, 65280);
				//	//player2BikeBufferedImage.setRGB(i+1, i+1, 255);
				//}
				
				//System.out.println("bikeHeight = " + bikeHeight + "; bikeWidth = " + bikeWidth);
				// TODO graphics.drawImage(player1BikeBufferedImage, p1x - maxDimension / 2, p1y - maxDimension / 2, maxDimension, maxDimension, null);
				//graphics.drawImage(player2BikeBufferedImage, p2x - maxDimension / 2, p2y - maxDimension / 2, maxDimension, maxDimension, null);
				
				//graphics.drawImage(bikeBufferedImage, p1x - bikeBufferedImage.getWidth() / 2, p1y - bikeBufferedImage.getHeight() / 2, bikeBufferedImage.getWidth(), bikeBufferedImage.getHeight(), null);
				//graphics.drawImage(bikeBufferedImage, p2x * DISPLAY_LOGIC_UNIT_SIZE, p2y * DISPLAY_LOGIC_UNIT_SIZE, 48, 16, null);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
//			for (int i = 0; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; ++i) {
//				if (ground[i] != 0) {
//					graphics.setColor(ground[i] == 1 ? Color.BLACK : (ground[i] == 2 ? Color.RED : Color.BLUE));
//					graphics.fillRect((i % DISPLAY_LOGIC_WIDTH) * DISPLAY_LOGIC_UNIT_SIZE, (i / DISPLAY_LOGIC_WIDTH) * DISPLAY_LOGIC_UNIT_SIZE, DISPLAY_LOGIC_UNIT_SIZE, DISPLAY_LOGIC_UNIT_SIZE);
//				}
//			}
			for (int x = 0; x < DISPLAY_LOGIC_WIDTH / DISPLAY_LOGIC_IMAGE_DIMENSION; ++x) {
				for (int y = 0; y < DISPLAY_LOGIC_HEIGHT / DISPLAY_LOGIC_IMAGE_DIMENSION; ++y) {
					graphics.drawImage(groundVisual[x][y], x * DISPLAY_LOGIC_IMAGE_DIMENSION, y * DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, DISPLAY_LOGIC_IMAGE_DIMENSION, null);
				}
			}

//			graphics.fillRect(25, 25, 2, 2);
//			graphics.fillRect(50, 50, 2, 2);
		}
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
				Thread.sleep(300);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
