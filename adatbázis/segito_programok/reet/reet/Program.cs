﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace reet
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Random alma = new Random();
            StreamWriter minden = new StreamWriter(@"lamare.txt");
            int kaja = 0;
            string[] allapot = new string[3]
                {"kész", "folyamatban", "lemondva" };
            for (int i = 0; i < 20; i++)
            {
                int al = alma.Next(0, 3);
                int szam = alma.Next(1, 5);
                int osszeg = 1080 * szam;
                //  int kaja=alma.Next(0,21);
                int hh = alma.Next(0, 25);
                int mm = alma.Next(0, 60);
                int ss = alma.Next(0, 60);
                int ev = alma.Next(2023, 2025);
                int ho = alma.Next(13);
                int nap = alma.Next(30);
                if (ho == 2 && nap == 29 || nap > 29)
                {
                    nap = alma.Next(28);
                }

                kaja++;
                if (i == 19)
                {
                    Console.WriteLine("(" + kaja + "," + kaja + ","  + kaja+ ")" + ";");
                    minden.WriteLine("(" + kaja + "," + kaja + "," + kaja + ")" + ";");
                }
                else
                {
                    Console.WriteLine("(" + kaja + "," + kaja + "," + kaja + ")" + ",");
                    minden.WriteLine("(" + kaja + "," + kaja + "," + kaja + ")" + ",");

                }
            }
            minden.Close();
            Console.ReadKey();
        }
    }
}
