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
        int nextSpaceshipId = 1;

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

        public Spaceship AddNewSpaceship()
        {
            var spaceship = new Spaceship { Id = nextSpaceshipId++ };
            Spaceships.Add(spaceship);
            return spaceship;
        }

        public void ProcessClientData(Spaceship spaceship, ClientData clientData)
        {
            spaceship.Name = clientData.Name;
            spaceship.Acceleration = clientData.Acceleration * 0.1;
            if (clientData.Shoot)
            {
                Missiles.Add(new Missile
                {
                    OwnerId = spaceship.Id,
                    Position = spaceship.Position,
                    Speed = spaceship.Speed * 2
                });
            }
        }

        public void Step()
        {
            foreach (var spaceship in Spaceships)
            {
                Move(ref spaceship.Position, ref spaceship.Speed, spaceship.Acceleration);
            }
            foreach (var missile in Missiles)
            {
                Move(ref missile.Position, ref missile.Speed, new Vector());
            }
        }

        private void Move(ref Point p, ref Vector s, Vector a)
        {
            // Gravity calculation
            foreach (var asteroid in Asteroids)
            {
                var v = asteroid.Position - p;
                var g = asteroid.R / v.LengthSquared;
                a += v / v.Length * g;
            }
            // Update speed and position
            s += a;
            p += s;
        }
    }
}
