import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class ECE554VisualSim {

	int DISPLAY_LOGIC_WIDTH = 256;
	int DISPLAY_LOGIC_HEIGHT = 256;
	int DISPLAY_LOGIC_UNIT_SIZE = 1;
	int[] ground = new int[DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT];

	int p1x = DISPLAY_LOGIC_WIDTH / 5;
	int p1y = DISPLAY_LOGIC_HEIGHT / 2;

	int p2x = DISPLAY_LOGIC_WIDTH * 4 / 5;
	int p2y = DISPLAY_LOGIC_HEIGHT / 2;
	
	char[] directions = {'d', 'j'};
	char[] nextDirections = {'d', 'j'};
	
	public static void main(String s[]) throws IOException {
		ECE554VisualSim ECE554VisualSimConstructor = new ECE554VisualSim();
		while (true) {
			ECE554VisualSimConstructor.start();
		}
	}
	
	public void start() throws IOException {
		JFrame jFrame = new JFrame("Sample PPU Simulator");
		jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		ground = new int[DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT];
		p1x = DISPLAY_LOGIC_WIDTH / 5;
		p1y = DISPLAY_LOGIC_HEIGHT / 2;

		p2x = DISPLAY_LOGIC_WIDTH * 4 / 5;
		p2y = DISPLAY_LOGIC_HEIGHT / 2;
		
		directions[0] = 'd';
		directions[1] = 'j';
		nextDirections[0] = 'd';
		nextDirections[1] = 'j';
		
		// top
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH; ++i) {
			ground[i] = 1;
		}
		// left
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; i += DISPLAY_LOGIC_WIDTH) {
			ground[i] = 1;
		}
		// right
		for (int i = DISPLAY_LOGIC_WIDTH - 1; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; i += DISPLAY_LOGIC_WIDTH) {
			ground[i] = 1;
		}
		// bottom
		for (int i = DISPLAY_LOGIC_WIDTH * (DISPLAY_LOGIC_HEIGHT - 1); i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; ++i) {
			ground[i] = 1;
		}
		
		PPU ppu = new PPU();
		jFrame.add(ppu);
		jFrame.setSize(DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_UNIT_SIZE*5 + 20, DISPLAY_LOGIC_HEIGHT * DISPLAY_LOGIC_UNIT_SIZE*5 + 40);
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
			
			if (ground[p1y * DISPLAY_LOGIC_WIDTH + p1x] != 0) {
				if (ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] != 0) {
					System.out.println("tied");
				} else {
					System.out.println("player 2 wins");
				}
				jFrame.setVisible(false);
				return;
			} else {
				if (ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] != 0) {
					System.out.println("player 1 wins");
					jFrame.setVisible(false);
					return;
				}
			}
			ground[p1y * DISPLAY_LOGIC_WIDTH + p1x] = 2;
			ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] = 3;
			
			//System.out.println("done with interrupt; nextDirections[0] = " + nextDirections[0]);
			switch (nextDirections[0]) {
			case 'w': p1y--; break;
			case 'a': p1x--; break;
			case 's': p1y++; break;
			case 'd': p1x++; break;
			}
			directions[0] = nextDirections[0];
			switch (nextDirections[1]) {
			case 'i': p2y--; break;
			case 'j': p2x--; break;
			case 'k': p2y++; break;
			case 'l': p2x++; break;
			}
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
				//BufferedImage bikeBufferedImage = ImageIO.read(new File("images/duke_skateboard.jpg"));
				
				int temp;
				int bikeWidth = bikeBufferedImage.getWidth();
				int bikeHeight = bikeBufferedImage.getHeight();
				int maxDimension = Math.max(bikeWidth, bikeHeight);

//				
//				//wgraphics.drawImage(bufferedImage, 5, 5, 8, 24, null);
//				
//				Graphics2D g2 = bufferedImage.createGraphics();
//			    g2.rotate(Math.toRadians(90));  
//			    g2.drawImage(bufferedImage, null, 0, 0);
				
				int p1rotationCount = 0;
				switch (directions[0]) {
				case 'a': 
					p1rotationCount = 3; 
					temp = bikeHeight; 
					bikeHeight = bikeWidth; 
					bikeWidth = temp; 
					break;
				case 's': 
					p1rotationCount = 2; 
					break;
				case 'd': 
					p1rotationCount = 1; 
					temp = bikeHeight; 
					bikeHeight = bikeWidth; 
					bikeWidth = temp; 
					break;
				}
				
				AffineTransform affineTransform = new AffineTransform();
				//affineTransform.translate(bikeBufferedImage.getWidth() / 2, bikeBufferedImage.getHeight() / 2);
				//affineTransform.rotate(Math.toRadians(90) * p1rotationCount);
				//affineTransform.translate(-bikeBufferedImage.getWidth() / 2, -bikeBufferedImage.getHeight() / 2);
				
				affineTransform.rotate(Math.toRadians(90) * p1rotationCount, maxDimension / 2, maxDimension / 2);

				AffineTransformOp op = new AffineTransformOp(affineTransform, AffineTransformOp.TYPE_BILINEAR);
				bikeBufferedImage = op.filter(bikeBufferedImage, null);
				//System.out.println("bikeHeight = " + bikeHeight + "; bikeWidth = " + bikeWidth);
				graphics.drawImage(bikeBufferedImage, p1x - maxDimension / 2, p1y - maxDimension / 2, maxDimension, maxDimension, null);
				//graphics.drawImage(bikeBufferedImage, p1x - bikeBufferedImage.getWidth() / 2, p1y - bikeBufferedImage.getHeight() / 2, bikeBufferedImage.getWidth(), bikeBufferedImage.getHeight(), null);
				//graphics.drawImage(bikeBufferedImage, p2x * DISPLAY_LOGIC_UNIT_SIZE, p2y * DISPLAY_LOGIC_UNIT_SIZE, 48, 16, null);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			for (int i = 0; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; ++i) {
				if (ground[i] != 0) {
					graphics.setColor(ground[i] == 1 ? Color.BLACK : (ground[i] == 2 ? Color.RED : Color.BLUE));
					graphics.fillRect((i % DISPLAY_LOGIC_WIDTH) * DISPLAY_LOGIC_UNIT_SIZE, (i / DISPLAY_LOGIC_WIDTH) * DISPLAY_LOGIC_UNIT_SIZE, DISPLAY_LOGIC_UNIT_SIZE, DISPLAY_LOGIC_UNIT_SIZE);
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
				Thread.sleep(30);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
