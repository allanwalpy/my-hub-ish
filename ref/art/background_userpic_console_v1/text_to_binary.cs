const int output_length = 60;
const char leading_zero = '0';
const byte output_base = 16;
const int symbol_length_default = 2;

if (args.Length < 1)
{
    throw new ApplicationException();
}

String input = args[0];

var output_raw = "";
var current_symbol = "";
var char_length = 0;

for (int i = 0; i < input.Length; i++)
{
    current_symbol = Convert.ToString((byte)input[i], toBase: output_base).ToString();
    char_length = current_symbol.Length;
    for (int j = char_length; j < symbol_length_default; j++)
    {
        current_symbol = leading_zero + current_symbol;
    }

    output_raw += current_symbol;
}

Console.WriteLine(output_raw);

Console.WriteLine("// --- --- --- --- //");

var output_svg = "";
int raws_count = output_raw.Length / output_length + 1;
var substring_length = 0;

for (int i = 0; i < raws_count; i++)
{
    substring_length = (i + 1) * output_length < output_raw.Length
        ? output_length
        : output_raw.Length - i * output_length;

    output_svg += "\n"
        + $"<text id=\"numers_line_{i}\" class=\"numbers\" fill=\"#fff\" "
        + $"x=\"-5\" y=\"{42 * (i + 1) - 8}\""
        + $">{output_raw.Substring(i * output_length, substring_length)}</text>"
        + "\n"
    ;
}

Console.WriteLine(output_svg);
