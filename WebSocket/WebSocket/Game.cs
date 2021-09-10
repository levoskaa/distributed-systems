using System;
using System.Collections.Generic;
using System.Windows;

namespace WebSocket
{
    class Game
    {
        public List<Spaceship> Spaceships = new List<Spaceship>();
        public List<Missile> Missiles = new List<Missile>();
        public List<Asteroid> Asteroids = new List<Asteroid>();

        public Game()
        {
            var rng = new Random(5);
            for (int i = 0; i < 10; i++)
            {
                Asteroids.Add(new Asteroid
                {
                    R = rng.Next(1, 3),
                    Position = new Point(rng.Next(10, 100), rng.Next(10, 100))
                });
            }
        }

        public void Step()
        {
            // TODO
        }

        public Spaceship AddNewSpaceship()
        {
            var spaceship = new Spaceship();
            Spaceships.Add(spaceship);
            return spaceship;
        }
    }
}
