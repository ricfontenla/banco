require_relative 'conta'

class Conta_Corrente < Conta

  attr_reader :limite

  def initialize(numero, titular, saldo, limite)
    super(numero, titular, saldo)
    @limite = limite.to_f
  end

  def sacar(valor)
    if valor > 0
      if (@saldo + limite) >= valor
        @saldo -= valor
        puts
        puts("Saque de R$ #{valor} realizado com sucesso")
        puts ("Saldo: R$ #{@saldo}")
        puts
        return true
      else
        puts
        puts ("Saldo insuficiente para esse valor")
        puts ("Saldo: R$ #{@saldo}")
        puts
      end
    else
      puts('valor invalido')
    end
  end

end