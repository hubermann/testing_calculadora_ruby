class Calculadora

  def initialize(min, max)
    @limite_inferior = min
    @limite_superior = max
  end

  def sumar(x, y)
    validar_argumentos(x, y)
    raise ArgumentError.new("Se superó el límite superior") if x + y > @limite_superior
    x + y
  end

  def restar(x, y)
    validar_argumentos(x, y)
    raise ArgumentError.new("Se superó el límite inferior") if x - y < @limite_inferior
    x - y
  end

  def dividir(x,y)
    raise ArgumentError.new("La división debe ser entera") if x % y != 0
    x / y
  end

  def multiplicar(x,y)
    validar_argumentos(x, y)
    raise ArgumentError.new("Se superó el límite inferior") if x * y < @limite_inferior
    raise ArgumentError.new("Se superó el límite superior") if x * y > @limite_superior
    x * y
  end

  def validar_argumentos(x, y)
    raise ArgumentError.new("Primer parámetro supera el límite inferior")   if x < @limite_inferior
    raise ArgumentError.new("Segundo parámetro supera el límite inferior")  if y < @limite_inferior
    raise ArgumentError.new("Primer parámetro supera el límite superior")   if x > @limite_superior
    raise ArgumentError.new("Segundo parámetro supera el límite superior")  if y > @limite_superior
  end

end
