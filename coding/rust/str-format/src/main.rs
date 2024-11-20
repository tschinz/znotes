use core::f64::consts::E;

fn main() {
    println!("\n{:#^50}", " Align ");
    println!("Left Align:                    : {:.<8}", 1);
    println!("Right Align                    : {:.>8}", 1);
    println!("Center Align                   : {:.^8}", 1);

    println!("\n{:#^50}", " Fill ");
    println!("Left Align, Padding *          : {:*<8}", 1);
    println!("Right Align, Padding 0         : {:0>8}", 1);
    println!("Right Align, Padding 0         : {:>08}", 1);
    println!("Right Align, Padding _         : {: >8}", 1);
    println!("Center Align, Padding #        : {:#^8}", 1);

    println!("\n{:#^50}", " Sign ");
    println!("Right Align, Sign +            : {:>+8}", 1);
    println!("Right Align, Sign -            : {:>8}", -1);
    println!("Right Align, Sign +, Padding 0 : {:>+#08}", 1);
    println!("Right Align, Padding 0, Sign + : {:0>+#8}", 1);

    println!("\n{:#^50}", " Precision ");
    println!("Right Align, Prec 0            : {:>8.0}", E);
    println!("Right Align, Prec 1            : {:>8.1}", E);
    println!("Right Align, Prec 2            : {:>8.2}", E);
    println!("Right Align, Prec 3            : {:>8.3}", E);
    println!("Right Align, Prec 4            : {:>8.4}", E);
    println!("Right Align, Prec 5            : {:>8.5}", E);
    println!("Right Align, Prec 6            : {:>8.6}", E);
    println!("Right Align, Prec 7            : {:>8.7}", E);

    println!("\n{:#^50}", " Type ");
    println!("Integer                        : {:}", E as u32);
    println!("Float                          : {:}", E);
    println!("Binary                         : {:b}", 49374);
    println!("Binary alt                     : {:#b}", 49374);
    println!("Binary 32bit                   : {:#034b}", 49374);
    println!("Octal                          : {:o}", 49374);
    println!("Octal alt                      : {:#o}", 49374);
    println!("Octal 16 digit                 : {:#018o}", 49374);
    println!("hex                            : {:x}", 49374);
    println!("hex alt                        : {:#x}", 49374);
    println!("hex 8 digit                    : {:#010x}", 49374);
    println!("Hex                            : {:X}", 49374);
    println!("Hex alt                        : {:#X}", 49374);
    println!("Hex 8 digit                    : {:#010X}", 49374);
    println!("scientific                     : {:e}", E.powf(123.0));
    println!("Scientific                     : {:E}", E.powf(123.0));
    println!("Pointer                        : {:p}", &1);

    println!("\n{:#^50}", " Debug (Debug Trait required ");
    println!("{:?}", vec![1, 2, 3]);
    println!("{:#?}", vec![1, 2, 3]);

    println!("\n{:#^50}", " Examples ");
    println!(
        "Right Align, Padding ., Sign +, Prec 3, Scientific notation : {0:.>+10.3e}",
        std::f64::consts::E
    );
    println!(
        "padding leading 0, width 8 digits (8+2 (0x)), Hex alt       : {0:#010x}",
        49374
    );
}
