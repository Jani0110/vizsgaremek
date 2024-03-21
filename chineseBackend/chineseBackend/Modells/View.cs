using System.Collections.ObjectModel;
using System.Windows.Input;
using chineseBackend.Modells;

namespace FoodWebshop.ViewModels
{
    public class AdminViewModel : ViewModelBase
    {
        public new ObservableCollection<Etel> Etelek { get; set; }

        private readonly RelayCommand AddEtelCommand;
        private readonly RelayCommand DeleteFoodCommand;

        public ICommand Hozzaad { get; set; }
        public ICommand Torol { get; set; }

        private Etel valasztottEtel;

        public Etel ValasztottEtel
        {
            get { return valasztottEtel; }
            set
            {
                valasztottEtel = value;
                OnPropertyChanged(nameof(ValasztottEtel));
            }
        }

        private void OnPropertyChanged(string propertyName)
        {
           
        }

        public AdminViewModel()
        {
            Etelek = new ObservableCollection<Etel>();
            AddEtelCommand = new RelayCommand(EtelHozzaad);
            DeleteFoodCommand = new RelayCommand(EtelTorol);
        }

        private void EtelHozzaad(object obj)
        {
          
        }

        private void EtelTorol(object parameter)
        {
            if (valasztottEtel != null)
                Etelek.Remove(valasztottEtel);
        }
    }

    internal class RelayCommand
    {
        private readonly Action<object> etelHozzaad;

        public RelayCommand(Action<object> etelHozzaad)
        {
            this.etelHozzaad = etelHozzaad;
        }
    }

    public class ViewModelBase
    {
        protected ObservableCollection<Etel> Etelek { get; } = new ObservableCollection<Etel>();

        protected void EtelHozzaad(object etel)
        {
            Etelek.Add( new Etel { Nev = "EtelNeve", Ar = 0 });
        }

    }
}
