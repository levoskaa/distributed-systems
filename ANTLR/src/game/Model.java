package game;
import java.util.ArrayList;
import java.util.List;

public class Model {
    private int boardRows = 5, boardCols = 5, squareSize = 150;
    private Coordinates player = new Coordinates(0, 0);
    private Direction playerFacing = Direction.DOWN;
    private ArrayList<Coordinates> crates = new ArrayList<Coordinates>() {
        {
            add(new Coordinates(1, 1));
            add(new Coordinates(3,4));
            add(new Coordinates(4,0));
        }
    };
    private ArrayList<Coordinates> walls = new ArrayList<Coordinates>() {
        {
            add(new Coordinates(1, 3));
            add(new Coordinates(3,3));
            add(new Coordinates(4,4));
        }
    };

    public int getPlayerX() { return player.x;}
    public int getPlayerY() {return player.y;}
    public Direction getPlayerFacing() {return playerFacing;}

    public void movePlayer() {
        Coordinates newCoord = new Coordinates(player.x, player.y);
        switch (playerFacing) {
            case DOWN: newCoord.y += 1; break;
            case UP: newCoord.y -= 1; break;
            case RIGHT: newCoord.x += 1; break;
            case LEFT: newCoord.x -= 1; break;
        }

        if (isValidPlayerCoordinate(newCoord)) {
            player = newCoord;
            checkCratePickup();
        }
    }

    public void rotatePlayer() {
        playerFacing = playerFacing.rotate();
    }

    private void checkCratePickup() {
        if (crates.stream().anyMatch(c -> c.equals(player))) {
            Coordinates coord = crates.stream().filter(c -> c.equals(player)).findFirst().get();
            crates.remove(coord);
        }
    }

    private boolean isValidPlayerCoordinate(Coordinates newCoord) {
        return newCoord.x >= 0 && newCoord.x < boardRows && newCoord.y >= 0 && newCoord.y < boardCols && walls.stream().noneMatch(c -> c.equals(newCoord));
    }

    public int getBoardRows() {return boardRows; }
    public int getBoardCols() {return boardCols; }
    public int getSquareSize() {return squareSize; }
    public List<Coordinates> getCrates() {return crates;}
    public List<Coordinates> getWalls() {return walls;}
}