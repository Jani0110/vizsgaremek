using System;
using System.Collections.ObjectModel;
using System.Windows;
using chineseBackend.Modells; 

namespace WebshopAdminApp
{
    public partial class MainWindow : Window
    {
        private ObservableCollection<Rendeles> _products;

        public MainWindow()
        {
            InitializeComponent();
            _products = new ObservableCollection<Rendeles>(); 
            LoadProducts(); 
            ProductsDataGrid.ItemsSource = _products; 
        }

        private void LoadProducts()
        {
            _products.Add(new Rendeles { Id = 1, Name = "Product A", Price = 100 });
            _products.Add(new Rendeles { Id = 2, Name = "Product B", Price = 150 });
        }

        private void AddProductButton_Click(object sender, RoutedEventArgs e)
        {
            var newProduct = new Rendeles
            {
                Id = _products.Count + 1, 
                Name = ProductNameTextBox.Text,
                Price = Convert.ToDouble(ProductPriceTextBox.Text)
            };

            _products.Add(newProduct);

            ClearInputFields();
        }

        private void DeleteProductButton_Click(object sender, RoutedEventArgs e)
        {
            if (ProductsDataGrid.SelectedItem is Rendeles selectedProduct)
            {
                _products.Remove(selectedProduct); 
                
            }
        }

        private void ClearInputFields()
        {
            ProductNameTextBox.Clear();
            ProductPriceTextBox.Clear();
        }
    }
}
