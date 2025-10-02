import 'dart:math';
void main()
 {
  int v = 1; 
  double y = 4.6 * v;
  double z = 36.6 / v;
  double x_start = 1.23 * v;
  double dx = 1;
  int step = 10; 

  // Зовнішня функція замикання
  Function ft = outer(x_start, y, z, dx);

  for (int i = 0; i < step; i++) 
  {
    ft();
  }
}

// Внутрішня функція замикання 
Function outer(double x, double y, double z, double dx) 
{
  // Анонімна функція 
  Function b = (double x, double y, double z) 
  {
    return x * ((pow(y + atan(x * x + z), 0.1) + exp(1)) / (3 + pow(sin(pow(y, 3)), 2)));
  };

  return ()
   {
    double b_ = b(x, y, z);

    double numerator = sqrt(pow((x * x - z).abs(), 0.3) - pow((y + 2 * b_).abs(), 1 / 3));
    double denominator = 1 + (x / 1) + (pow(y, 2) / 2) + (pow(z, 3) / 6);
    double a = numerator / denominator;

    print("x = ${x.toStringAsFixed(2)} y = ${y.toStringAsFixed(2)} z = ${z.toStringAsFixed(2)} b = ${b_.toStringAsFixed(4)} a = ${a.toStringAsFixed(6)}");

    x += dx; 
  };
}
