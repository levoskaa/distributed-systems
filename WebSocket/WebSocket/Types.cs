using System.Windows;

namespace WebSocket
{
    class Spaceship
    {
        public int Id;
        public string Name;
        public Point Position;
        public Vector Speed;
        public Vector Acceleration;
    }

    class Missile
    {
        public int OwnerId;
        public Point Position;
        public Vector Speed;
    }

    class Asteroid
    {
        public double R;
        public Point Position;
    }
}