class CnaBsController < ApplicationController
  before_action :set_cnab, only: [ :update, :destroy]

  # GET /cnabs
  def index
    @cnabs = Cnab.all

    render json: @cnabs

  end

  # GET /cnabs/1
  def show

      @cnabs = Cnab.where(loja: params['id'])
      total = []
      @cnabs.map do |cnab|
       if cnab.tipo == 1 || cnab.tipo == 4 || cnab.tipo == 5 || cnab.tipo == 6 || cnab.tipo == 7 || cnab.tipo == 8

        total << + cnab.valor

     elsif cnab.tipo == 2 || cnab.tipo == 3 || cnab.tipo == 9
        total << - cnab.valor
     else
      render json: erro, status: :unprocessable_entity
     end

      end

      render json: {cnabs: @cnabs, total: total.sum }

  end

  # POST /cnabs
  def create
      erro = []
      arquivo = params['arquivo']
      File.open(arquivo).each do |linha|
      begin

        tipo = linha[0].to_i rescue linha[0].to_i
        data = linha[1..8] rescue linha[1..8]
        valor = linha[9..18].to_f / 100 rescue linha[9..18].to_f
        cpf = linha[19..29] rescue linha[19..29]
        cartao = linha[30..41] rescue linha[30..41]
        hora = linha[42..47] rescue linha[42..47]
        dono = linha[48..61].strip rescue linha[48..61].strip
        loja = linha[62..80].strip rescue linha[62..80].strip

        Cnab.create(tipo: tipo, data: data, valor: valor, cpf: cpf, cartao: cartao, hora: hora, dono: dono, loja: loja)
      rescue Exception => err
        erro << err.message
      end
   end
   if erro.blank?
    render json: {message: "sucesso"}
  else
    render json: erro, status: :unprocessable_entity
  end
  end

  # PATCH/PUT /cnabs/1
  def update
    if @cnab.update(cnab_params)
      render json: @cnab
    else
      render json: @cnab.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cnabs/1
  def destroy
    @cnab.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cnab
      @cnab = Cnab.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cnab_params
      params.require(:cnab).permit(:arquivo)
    end
end
