import Foundation

struct Product {
    var name: String
    var price: Double
    var type: String
    var url: String?
}



// type: "clothes",
// type: "shoes",
// type: "accessories",

let Products: [Product] = [
    Product(name: "ПУХОВИК HELIONIC", price: 11999, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/22497829237946f392cda84000ffc960_9366/Puhovik_Helionic_chernyj_BQ2001_01_laydown.jpg"),
    Product(name: "КРОССОВКИ NITE JOGGER", price: 12999, type: "shoes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,t_ivy,e_sharpen/7fb87dcb966749dd8c16ac5300abcf66_faec/Krossovki_Nite_Jogger_belyj_S29038_HM1.jpg"),
    Product(name: "КРОССОВКИ STREETBALL", price: 11999, type: "shoes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/141439786b564a08b5a3abdd00bbe4bd_9366/Krossovki_Streetball_bezhevyj_FZ3582_01_standard.jpg"),
    Product(name: "КРОССОВКИ FYW XTA", price: 12999, type: "shoes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/d1bfdaa78ddb4558a4c2ac2c013d2ee9_9366/Krossovki_FYW_XTA_biryuzovyj_FW9190_01_standard.jpg"),
    Product(name: "КРОССОВКИ FYW XTA", price: 12999, type: "shoes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/fb85ede7f6a6487fa754aba500b468f2_9366/Krossovki_FYW_XTA_zelenyj_FW3239_01_standard.jpg"),
    Product(name: "ХУДИ R.Y.V.", price: 6999, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/60afb533fe1446ef9ff6abc900c80071_9366/Hudi_R.Y.V._krasnyj_GD9321_21_model.jpg"),
    Product(name: "ХУДИ BACK + FRONT PRINT TREFOIL", price: 5499, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/03ee4c35a74d407c8115ab6d0133b5c0_9366/Hudi_Back_+_Front_Print_Trefoil_oranzhevyj_GE0794_21_model.jpg"),
    Product(name: "БРЮКИ M JQRD FTW", price: 7499, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/0fdc5919f41f464f88c8ac2800be6cab_9366/Bryuki_M_JQRD_FTW_chernyj_FS4299_21_model.jpg"),
    Product(name: "КУРТКА-БОМБЕР VRCT", price: 7999, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/fbb2e7b13cd8497bb631aa7900dcbd6e_9366/Kurtka-bomber_VRCT_chernyj_EA0372_21_model.jpg"),
    Product(name: "БРЮКИ CONDIVO 20", price: 3499, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/72a6affe383f4fd2b8faaabf00ef98fd_9366/Bryuki_Condivo_20_sinij_ED9257_21_model.jpg"),
    Product(name: "БРЮКИ ADVENTURE FIELD", price: 6999, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/99f51adb3b084575b27aac0e00a7a08e_9366/Bryuki_Adventure_Field_krasnyj_GD5592_21_model.jpg"),
    Product(name: "БРЮКИ B TRF AB WV", price: 5999, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/d59eaa3ac60e48fa8645abce00fb13cb_9366/Bryuki_B_TRF_AB_WV_chernyj_GE0831_21_model.jpg"),
    Product(name: "БРЮКИ ADICOLOR CLASSICS PRIMEBLUE SST", price: 5499, type: "clothes", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/ffeb37a255444a978a82ab8b00ab23c4_9366/Bryuki_Adicolor_Classics_Primeblue_SST_krasnyj_GF0208_21_model.jpg"),
    Product(name: "ШАПКА", price: 2699, type: "accessories", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,t_ivy,e_sharpen/ff00ff2baaae48d3aef4ac5300aadfd6_faec/Shapka_zheltyj_GT9042_HM1.jpg"),
    Product(name: "ШАПКА-УШАНКА COLD.RDY", price: 3999, type: "accessories", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/2943ad8e80d84341929daba400b6a9de_9366/Shapka-ushanka_COLD.RDY_chernyj_FS9028_01_standard.jpg"),
    Product(name: "ШАПКА ADICOLOR POMPOM", price: 1999, type: "accessories", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/cee4568272154e169173ab3b00bbee5d_9366/Shapka_Adicolor_Pompom_sinij_GD4596_01_standard.jpg"),
    Product(name: "ШАПКА ADIDAS BY STELLA MCCARTNEY", price: 3999, type: "accessories", url: "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy/5e5c0c3a6a0347b88e92aba400f7966e_9366/Shapka_adidas_by_Stella_McCartney_fioletovyj_GL2006_01_standard.jpg")
]
