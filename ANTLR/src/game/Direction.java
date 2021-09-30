package game;

public enum Direction {
    LEFT, RIGHT, UP, DOWN;

    public Direction rotate() {
        switch (this) {
            case LEFT: return UP;
            case RIGHT: return DOWN;
            case UP: return RIGHT;
            default: return LEFT;
        }
    }
}
