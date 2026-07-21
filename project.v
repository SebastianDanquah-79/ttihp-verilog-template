# Tiny Tapeout project information
project:
  title:        "Adaptive Traffic Light Controller"      # Project title
  author:       "Sebastian Danquah"      # Your name
  discord:      ""      # Your discord username, for communication and automatically assigning you a Tapeout role (optional)
  description:  "Adaptive traffic light Asic with OR/AND logic gates"      # One line description of what your project does
  language:     "Verilog" # other examples include SystemVerilog, Amaranth, VHDL, etc
  clock_hz:     0       # Clock frequency in Hz (or 0 if not applicable)

  # How many tiles your design occupies? A single tile is about 167x108 uM.
  tiles: "1x1"          # Valid values: 1x1, 1x2, 2x2, 3x2, 4x2, 6x2 or 8x2

  # Your top module name must start with "tt_um_". Make it unique by including your github username:
  top_module:  "tt_um_example"
module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path
    input  wire ena,            // always 1 when powered
    input  wire clk,            // clock
    input  wire rst_n           // reset_n - low to reset
);

    // Inputs
    wire sensor = ui_in[0];
    wire timer  = ui_in[1];

    // Combinational Logic Gates
    wire red    = sensor;
    wire green  = (~sensor) & (~timer);
    wire yellow = timer;

    // Outputs
    assign uo_out[0] = red;
    assign uo_out[1] = yellow;
    assign uo_out[2] = green;
    assign uo_out[7:3] = 5'b0;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Suppress unused warnings
    wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};

endmodule
  # List your project's source files here.
  # Source files must be in ./src and you must list each source file separately, one per line.
  # Don't forget to also update `PROJECT_SOURCES` in test/Makefile.
  source_files:
    - "project.v"

# The pinout of your project. Leave unused pins blank. DO NOT delete or add any pins.
# This section is for the datasheet/website. Use descriptive names (e.g., RX, TX, MOSI, SCL, SEG_A, etc.).
pinout:
  # Inputs
  ui[0]: ""
  ui[1]: ""
  ui[2]: ""
  ui[3]: ""
  ui[4]: ""
  ui[5]: ""
  ui[6]: ""
  ui[7]: ""

  # Outputs
  uo[0]: ""
  uo[1]: ""
  uo[2]: ""
  uo[3]: ""
  uo[4]: ""
  uo[5]: ""
  uo[6]: ""
  uo[7]: ""

  # Bidirectional pins
  uio[0]: ""
  uio[1]: ""
  uio[2]: ""
  uio[3]: ""
  uio[4]: ""
  uio[5]: ""
  uio[6]: ""
  uio[7]: ""

# Do not change!
yaml_version: 6
