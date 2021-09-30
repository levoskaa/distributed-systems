package game;

public class Coordinates {
    public int x;
    public int y;

    public Coordinates(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) return false;

        if (obj instanceof Coordinates)
            return ((Coordinates) obj).x == x && ((Coordinates) obj).y == y;

        return super.equals(obj);
    }
}
