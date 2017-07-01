defmodule Average do
    def start() do
        values = get_values()
        result = calc(values)

        IO.puts "Media: #{result}"
        check_result(result)
    end
    
    def get_values() do
        {nota1, _} = IO.gets("") |> Float.parse
        {nota2, _} = IO.gets("") |> Float.parse
        {nota3, _} = IO.gets("") |> Float.parse
        {nota4, _} = IO.gets("") |> Float.parse

        [nota1 * 2, nota2 * 3, nota3 * 4, nota4]
    end

    def calc(results) do
        Enum.reduce(results, &(&1 + &2)) / 10
        |> Float.ceil(2)
    end

    def check_result(result) do
        if result >= 7.0 do
            IO.puts "Aluno aprovado."
        else
            if result < 5.0 do
                IO.puts "Aluno reprovado."
            else
                IO.puts "Aluno em exame."
                exam(result)
            end
        end
    end

    def exam(result) do
        {nota, _} = IO.gets("") |> Float.parse
        IO.puts "Nota do exame: #{nota}"
        new_result = (result + nota) / 2.0
        if new_result >= 5.0 do
            IO.puts "Aluno aprovado."
        else
            IO.puts "Aluno reprovado."
        end
        IO.puts "Media final: #{new_result}"
    end
end

Average.start()