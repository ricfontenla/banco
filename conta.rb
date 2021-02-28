require_relative 'cliente'

class Conta

  attr_reader :numero, :titular, :saldo
  
  def initialize(numero, titular, saldo)
    @numero = numero
    @titular = titular
    @saldo = saldo.to_f
  end

  def sacar(valor)
    if valor > 0
      if @saldo >= valor
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

  def depositar(valor)
    if valor > 0
      @saldo += valor
      puts
      puts("Deposito de R$ #{valor} realizado com sucesso")
      puts
    end
  end

  def transferir(conta_destino, valor)
    saque = sacar(valor)
    if saque == true
      conta_destino.depositar(valor)
      puts
      puts("Transferencia de R$ #{valor} realizada com sucesso")
      puts
    else
      puts
      puts ('Não foi possivel realizar a transferencia')
      puts
    end  
  end

end
