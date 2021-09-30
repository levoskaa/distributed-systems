package game;

public class GameController {

    private Model model;
    private View view;

    private GameController() {
        model = new Model();
        view = new View(model);

        view.getMoveButton().addActionListener(e -> move());
        view.getRotateButton().addActionListener(e -> rotate());
    }

    public void move() {
        model.movePlayer();
        view.refresh();
        checkWinCondition();
    }

    public void rotate() {
        model.rotatePlayer();
        view.refresh();
    }

    public Direction getPlayerFacing() {
        return model.getPlayerFacing();
    }

    public void displayMessage(String message) {
        view.displayMessage(message);
    }

    private void checkWinCondition() {
        if (model.getCrates().isEmpty())
            view.win();
    }

    public static void main(String[] args) {
        new GameController();
    }
}