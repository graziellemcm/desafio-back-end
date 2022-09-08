require 'test_helper'

class CnaBsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cnab = cnabs(:one)
  end

  test "should get index" do
    get cnabs_url, as: :json
    assert_response :success
  end

  test "should create cnab" do
    assert_difference('Cnab.count') do
      post cnabs_url, params: { cnab: { cartao: @cnab.cartao, cpf: @cnab.cpf, data: @cnab.data, dono: @cnab.dono, hora: @cnab.hora, loja: @cnab.loja, tipo: @cnab.tipo, valor: @cnab.valor } }, as: :json
    end

    assert_response 201
  end

  test "should show cnab" do
    get cnab_url(@cnab), as: :json
    assert_response :success
  end

  test "should update cnab" do
    patch cnab_url(@cnab), params: { cnab: { cartao: @cnab.cartao, cpf: @cnab.cpf, data: @cnab.data, dono: @cnab.dono, hora: @cnab.hora, loja: @cnab.loja, tipo: @cnab.tipo, valor: @cnab.valor } }, as: :json
    assert_response 200
  end

  test "should destroy cnab" do
    assert_difference('Cnab.count', -1) do
      delete cnab_url(@cnab), as: :json
    end

    assert_response 204
  end
end
