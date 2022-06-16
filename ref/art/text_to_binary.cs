const String file_output_txt = "output.hide.txt";
const String file_output_svg = "output.hide.svg.txt";
const int output_length = 64;

if (args.Length < 1)
{
    throw new ApplicationException();
}

String input = args[0];

var output_raw = "";

for (int i = 0; i < input.Length; i++)
{
    output_raw += Convert.ToString((byte)input[i], toBase: 2).ToString();
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
        + $"x=\"-7\" y=\"{42 * (i + 1) - 24}\""
        + $">{output_raw.Substring(i * output_length, substring_length)}</text>"
        + "\n"
    ;
}

Console.WriteLine(output_svg);
