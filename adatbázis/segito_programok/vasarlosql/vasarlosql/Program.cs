using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace vasarlosql
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Random alma = new Random();
            StreamWriter minden = new StreamWriter(@"lamav.txt");
            int kaja = 0;
            int[] allapot = new int[]
                { 20,30,70};
           string[] nev = new string[]
                {"Cádók","Cecilián","Celesztin","Cézár","Ciceró","Ciprián","Cirill","Cirják","Cirjék","Círus","Cvi","Csaba","Csák","Csanád","Csát","Berger","Berián","Beriszló","Berke","Berker","Berkó","Bernárd","Bernát","Bertalan","Bertel","Bertil","Bertin","Bertold","Berton","Bertram","Berzsián","Bese","Beten","Betlen","Geréb","Gereben","Gergely","Gergő","Gerhárd","Gerjén","Germán","Gernot","Gerold","Gerő","Gerváz","Gerzson","Géza","Gibárt","Gida","Gilbert","Gilgames","Girót","Gisó","Glenn","Gobert","Godó","Godvin","Gópál","Gorán","Gorda"};
            string[] venev = new string[]
                { "Nagy ","Kovács ","Tóth ","Szabó ","Horváth ","Varga ","Kiss ","Molnár ","Németh ","Balogh ","Farkas ","Lakatos ","Papp ","Takács ","Juhász ","Oláh ","Mészáros ","Simon ","Rácz ","Fekete ","Szilágyi ","Török ","Fehér ","Balázs ","Gál "};
            string[] email = new string[]
                { "Cadok","Cecilian","Celesztin","Cezar","Cicero","Ciprian","Cirill","Cirjak","Cirjek","Cirus","Cvi","Csaba","Csak","Csanad","Csat","Berger","Berian","Beriszlo","Berke","Berker","Berko","Bernard","Bernat","Bertalan","Bertel","Bertil","Bertin","Bertold","Berton","Bertram","Berzsian","Bese","Beten","Betlen","Gereb","Gereben","Gergely","Gergo","Gerhard","Gerjen","German","Gernot","Gerold","Gero","Gervaz","Gerzson","Geza","Gibart","Gida","Gilbert","Gilgames","Girot","Giso","Glenn","Gobert","Godo","Godvin","Gopal","Goran","Gorda"};
            for (int i = 0; i < 20; i++)
            {
                int al = alma.Next(0, 3);
                int szam = alma.Next(1, 5);
                int osszeg = 1080 * szam;
                int vv=alma.Next(venev.Length);
                int vnev=alma.Next(nev.Length);
                int eszam=alma.Next(1000,10000);
                int tszam=alma.Next(1000000,10000000);
                //  int kaja=alma.Next(0,21);
               int val=alma.Next(3);
               
               
                kaja++;
                if (i == 19)
                {
                    Console.WriteLine("(" + kaja + ",'" + venev[vv]+"" + nev[vnev] +"',"+ "'"+ email[vnev]+""+eszam+"@gmail.com"+"'"+","+ allapot[val] +""+tszam+ "," + "'" + email[vnev] + "" + eszam + "'" +",'"+ email[vnev]+eszam/2 +"'" +")" + ";");
                    minden.WriteLine("(" + kaja + ",'" + venev[vv] + "" + nev[vnev] + "'," + "'" + email[vnev] + "" + eszam + "@gmail.com" + "'" + "," + allapot[val] + "" + tszam + "," + "'" + email[vnev] + "" + eszam + "'" + ",'" + email[vnev] + eszam / 2 + "'" + ")" + ";");
                }
                else
                {
                    Console.WriteLine("(" + kaja + ",'" + venev[vv] + "" + nev[vnev] + "'," + "'" + email[vnev] + "" + eszam + "@gmail.com" + "'" + ","  + allapot[val] + "" + tszam + "," + "'" + email[vnev] + "" + eszam + "'" + ",'" + email[vnev] + eszam / 2 + "'" + ")" + ",");
                    minden.WriteLine("(" + kaja + ",'" + venev[vv] + "" + nev[vnev] + "'," + "'" + email[vnev] + "" + eszam + "@gmail.com" + "'" + "," + allapot[val] + "" + tszam + "," + "'" + email[vnev] + "" + eszam + "'" + ",'" + email[vnev] + eszam / 2 + "'" + ")" + ",");
                }
            }
            minden.Close();
            Console.ReadKey();
        }
    }
}
