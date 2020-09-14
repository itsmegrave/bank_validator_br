defmodule BankValidatorBR.Banks.Util do
  @moduledoc """
  Documentation for `BankValidatorBR.Banks.Util`.
  """
  def is_valid_agency_code(agency_code) do
    if length(agency_code) == 4 do
      {:ok, :valid}
    else
      {:error, :invalid_agency_code_length}
    end
  end

  @spec is_valid_numeric_digit?(String.t() | Integer.t()) ::
          {:not_valid, :non_numeric_digit} | {:ok, integer}
  def is_valid_numeric_digit?(digit) when is_integer(digit), do: {:ok, digit}

  def is_valid_numeric_digit?(digit) do
    case Integer.parse(digit) do
      {parsed_digit, _rest} ->
        {:ok, parsed_digit}

      _ ->
        {:not_valid, :non_numeric_digit}
    end
  end
end
