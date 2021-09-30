package game;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

class View {
    private final static int GAP = 2;
    private Model model;
    private MainPanel mainPanel;
    private JFrame frame;

    public JButton getMoveButton() {return mainPanel.getMoveButton();}
    public JButton getRotateButton() {return mainPanel.getRotateButton();}

    View(Model model) {
        this.model = model;
        createAndShowGUI();
    }

    void refresh() {
        mainPanel.repaint();
    }

    void win() {
        displayMessage("You won!");
        frame.dispatchEvent(new WindowEvent(frame, WindowEvent.WINDOW_CLOSING));
    }

    void displayMessage(String message) {
        JOptionPane.showMessageDialog(frame, message);
    }

    private void createAndShowGUI() {
        frame = new JFrame("Robot Game");
        frame.setResizable(false);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainPanel = new MainPanel();
        frame.add(mainPanel);
        frame.pack();
        frame.setVisible(true);
    }

    class MainPanel extends JPanel {
        private BottomPanel bPanel;

        MainPanel() {
            setLayout(new BorderLayout(GAP,GAP));
            add(new BoardPanel(), BorderLayout.CENTER);
            bPanel = new BottomPanel();
            add(bPanel, BorderLayout.PAGE_END);
        }

        public JButton getMoveButton() {return bPanel.moveButton;}
        public JButton getRotateButton() {return bPanel.rotateButton;}
    }

    class BoardPanel extends JPanel {
        Player player;
        ArrayList<Crate> crates = new ArrayList<>();
        ArrayList<Wall> walls = new ArrayList<>();
        BoardPanel() {
            setBorder(BorderFactory.createLineBorder(Color.BLACK, GAP));
            GridLayout layout = new GridLayout(model.getBoardRows(), model.getBoardCols());
            setLayout(layout);

            for (int i = 0; i <model.getBoardRows(); i++) {
                for (int j = 0; j < model.getBoardCols(); j++) {
                    add(new EmptyTile());
                }
            }

            player = new Player();
            player.setBounds(new Rectangle(model.getPlayerX(), model.getPlayerY(), model.getSquareSize(), model.getSquareSize()));

            for (Coordinates c : model.getWalls()) {
                Wall wall = new Wall(c);
                wall.setBounds(new Rectangle(c.x * model.getSquareSize(), c.y * model.getSquareSize(), model.getSquareSize(), model.getSquareSize()));
                walls.add(wall);
            }
        }

        private void updateCrates() {
            crates.clear();
            for (Coordinates c : model.getCrates()) {
                Crate crate = new Crate(c);
                crate.setBounds(new Rectangle(c.x * model.getSquareSize(), c.y * model.getSquareSize(), model.getSquareSize(), model.getSquareSize()));
                crates.add(crate);
            }
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            player.paint(g);

            updateCrates();
            for (Crate c : crates)
                c.paint(g);

            for (Wall w : walls)
                w.paint(g);
        }
    }

    class EmptyTile extends JLabel {
        EmptyTile() {
            setPreferredSize(new Dimension(model.getSquareSize(), model.getSquareSize()));
            setBorder(BorderFactory.createLineBorder(Color.BLACK, GAP));
        }
    }

    class Crate extends JLabel {
        private Coordinates coord;

        Crate(Coordinates c) {
            super();
            coord = c;
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);

            Image image = null;
            try {
                image = ImageIO.read(new File("res\\crate.png")).getScaledInstance(model.getSquareSize(), model.getSquareSize(), Image.SCALE_DEFAULT);
            } catch (IOException e) {
                e.printStackTrace();
            }

            g.drawImage(image, coord.x * model.getSquareSize(), coord.y * model.getSquareSize(), null);
        }
    }

    class Wall extends JLabel {
        private Coordinates coord;

        Wall(Coordinates c) {
            super();
            coord = c;
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);

            Image image = null;
            try {
                image = ImageIO.read(new File("res\\wall.png")).getScaledInstance(model.getSquareSize(), model.getSquareSize(), Image.SCALE_DEFAULT);
            } catch (IOException e) {
                e.printStackTrace();
            }

            g.drawImage(image, coord.x * model.getSquareSize(), coord.y * model.getSquareSize(), null);
        }
    }

    class Player extends JLabel{
        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);

            Image image = null;
            try {
                String fileName = getRobotImagePath();
                image = ImageIO.read(new File(fileName)).getScaledInstance(model.getSquareSize(), model.getSquareSize(), Image.SCALE_DEFAULT);
            } catch (IOException e) {
                e.printStackTrace();
            }

            g.drawImage(image, model.getPlayerX() * model.getSquareSize(), model.getPlayerY() * model.getSquareSize(), null);
        }
    }

    private String getRobotImagePath() {
        switch (model.getPlayerFacing()) {
            case UP: return "res\\robotUp.png";
            case DOWN: return "res\\robotDown.png";
            case LEFT: return "res\\robotLeft.png";
            default: return "res\\robotRight.png";
        }
    }

    class BottomPanel extends JPanel {
        public JButton moveButton = new JButton("move");
        public JButton rotateButton = new JButton("rotate");

        BottomPanel() {
            this.setLayout(new FlowLayout());
            add(moveButton);
            add(rotateButton);
        }
    }
}