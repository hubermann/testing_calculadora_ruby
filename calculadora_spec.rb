require './calculadora'

RSpec.describe Calculadora do
  context "Instanciada con limite inferior en -100 y superior en 100" do

    calculadora = Calculadora.new(-100,100)

    it "Cuando sumo 10 + 5 retorna 15" do
      resultado = calculadora.sumar(10,5)
      expect(resultado).to eq 15
    end

    it "Cuando sumo 2 + 2 el resultado es 4" do
      resultado = calculadora.sumar(2,2)
      expect(resultado).to eq 4
    end

    it "Cuando sumo 5 + 7 el resultado es 12" do
      resultado = calculadora.sumar(5,7)
      expect(resultado).to eq 12
    end

    it "la suma es conmutativa cuando sumo 3 + 5 y 5 + 3 ambos resultados son iguales" do
      resultado_uno = calculadora.sumar(3,5)
      resultado_dos = calculadora.sumar(5,3)
      expect(resultado_uno).to eq resultado_dos
    end

    it "La suma de números negativos da por resultado otro número negativo" do
      resultado = calculadora.sumar(-3,-5)
      expect(resultado).to eq -8
    end

    it "Se realiza una resta en la que el primer valor es mayor que el segundo.
    Cuando le resto 3 a 5. Entonces el resultado es 2" do
      resultado = calculadora.restar(5,3)
      expect(resultado).to eq 2
    end

    it "Cuando le resto 3 a 2 el resultado es -1" do
      resultado = calculadora.restar(2,3)
      expect(resultado).to eq -1
    end

    it "La resta no es conmutativa. Cuando resto 4 menos 2 es diferente que 2 menos 4" do
      resultado_uno = calculadora.restar(4,2)
      resultado_dos = calculadora.restar(2,4)
      expect(resultado_uno).not_to eq resultado_dos
    end

    it "Se realiza una resta de dos valores negativos. Cuando resto -4 a -2 el resultado es 2" do
      resultado = calculadora.restar(-2,-4)
      expect(resultado).to eq 2
    end


  end

  context "Una división entera de dos valores positivos." do

    calculadora = Calculadora.new(-100,100)

    it "Cuando divido 2 por 2 el resultado es 1" do
      resultado = calculadora.dividir(2,2)
      expect(resultado).to eq 1
    end
  end

  context "Se realiza una división entera de dos valores positivos." do

    calculadora = Calculadora.new(-100,100)

    it "Cuando divido 10 por 5 el resultado es 2" do
      expect(calculadora.dividir(10,5)).to eq 2
    end
  end

  context "Se realiza una división entera de un positivo por un negativo." do

    calculadora = Calculadora.new(-100,100)

    it "Cuando divido 10 por -5 el resultado es -2" do
      resultado = calculadora.dividir(10,-5)
      expect(resultado).to eq -2
    end
  end

  context "Se realiza una división no entera" do

    calculadora = Calculadora.new(-100,100)

    it "divido 3 por 2 arroja un ValueError con el mensaje 'La división debe ser entera'" do
      expect { calculadora.dividir(3,2) }.to raise_error(ArgumentError)
    end
  end

  context "Se realiza una división por cero" do

    calculadora = Calculadora.new(-100,100)

    it 'Cuando divido 3 por 0 la calculadora arroja un ZeroDivisionError' do
      expect { calculadora.dividir(3,0) }.to raise_error(ZeroDivisionError)
    end
  end

  context 'La resta arroja por resultado un número más bajo que el límite inferior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando resto 4 a -5 la calculadora arroja un ValueError con el mensaje "Se superó el límite inferior"' do
      expect { calculadora.dividir(4,-5) }.to raise_error(ArgumentError)
    end
  end

  context 'La suma arroja por resultado un número más alto que el límite superior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando sumo 5 + 4 la calculadora arroja un ValueError con el mensaje "Se superó el límite superior"' do
      expect{ calculadora.sumar(5,4) }.to raise_error(ArgumentError)
    end
  end

  context 'Se realiza una multiplicación de dos valores' do
    calculadora = Calculadora.new(-100,100)
    it 'Cuando se multiplica 2 x 2 el resultado es 4' do
      expect(calculadora.multiplicar(2,2)).to eq 4
    end
  end

  context 'Se realiza una multiplicación de dos valores' do
    calculadora = Calculadora.new(-100,100)
    it 'Cuando se multiplica 4 x 3 el resultado es 12' do
      expect(calculadora.multiplicar(4,3)).to eq 12
    end
  end

  context 'La multiplicación es conmutativa' do
    calculadora = Calculadora.new(-100, 100)
    it 'Cuando multiplico 3 por 5 y multiplico 5 por 3 los resultados son iguales'do
      resultado_uno = calculadora.multiplicar(3,5)
      resultado_dos = calculadora.multiplicar(5,3)
      expect(resultado_uno).to eq resultado_dos
    end
  end

  context 'Se realiza una multiplicación de dos valores negativos' do
    calculadora = Calculadora.new(-100, 100)
    it 'Cuando multiplico -3 por -5 el resultado es 15' do
      resultado = calculadora.multiplicar(-3,-5)
      expect(resultado).to eq 15
    end
  end

  context 'La multiplicación arroja por resultado un número más bajo que el límite inferior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando multiplico 2 por -3 la calculadora arroja un ValueError con el mensaje "Se superó el límite inferior"' do
      expect {calculadora.multiplicar(2,-3)}.to raise_error(ArgumentError)
    end
  end

  context 'La multiplicación arroja por resultado un número más alto que el límite superior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando multiplico 2 por 3 la calculadora arroja un ValueError con el mensaje "Se superó el límite superior"' do
      expect {calculadora.multiplicar(2,3)}.to raise_error(ArgumentError)
    end
  end

  context 'El primer parámetro es menor que el límite inferior' do
    calculadora = Calculadora.new(-5,5)
    it 'Si el primer parámetro es menor al límite inferior arroja un ArgumentError con el mensaje "Primer parámetro supera el límite inferior"' do
      expect {calculadora.validar_argumentos(-10,2)}.to raise_error(ArgumentError, 'Primer parámetro supera el límite inferior')
    end
  end

  context 'El segundo parámetro es menor que el límite inferior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando el segundo parámetro es menor al límite inferior arroja un ValueError con el mensaje "Segundo parámetro supera el límite inferior"' do
      expect {calculadora.validar_argumentos(3,12)}.to raise_error(ArgumentError, 'Segundo parámetro supera el límite superior')
    end
  end

  context 'El segundo parámetro es menor que el límite inferior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando el segundo parámetro es menor al límite inferior arroja un ValueError con el mensaje "Segundo parámetro supera el límite inferior"' do
      expect {calculadora.validar_argumentos(3,-12)}.to raise_error(ArgumentError, 'Segundo parámetro supera el límite inferior')
    end
  end

  context 'El segundo parámetro es mayor que el límite superior' do
    calculadora = Calculadora.new(-5,5)
    it 'Cuando el segundo parámetro es mayor al límite superior arroja un ValueError con el mensaje "Segundo parámetro supera el límite superior"' do
      expect {calculadora.validar_argumentos(3,12)}.to raise_error(ArgumentError, 'Segundo parámetro supera el límite superior')
    end
  end

end
