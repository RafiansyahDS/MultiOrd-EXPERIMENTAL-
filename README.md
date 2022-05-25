# MultiOrd-EXPERIMENTAL-
A Multi open order script for metatrader 4

![image](https://user-images.githubusercontent.com/92172143/170172615-5f89baac-ec8b-4937-809c-83466ad0ff99.png)

## USAGE
Turn On the Autotrading first on metatrader

- DelayMode
  * True = Multiple order price may will DIFFERENT each other and change depend on market price (will execute the amount of expected layer)
  * False = Multiple order price will be the SAME each other (May not execute the amount of expected layer)

- Lot
 <br> The size of lot

- Slippage
 <br> The size of slippage

- SL_Price
 <br> Stop Loss Price. *Remember fill this input for the price not the how much currency.

- TP_Price
 <br> Take Profit Price. *Remember fill this input for the price not the how much currency.

- Aksi
 <br> Choose Buy / Sell action.

- Layer
 <br> Input How Many Layer/Multiple of order you want.
  (with DelayMode false, the layer/multiple order may not executed with expected amount of layer)


## CAUTIONS
this script still on experimental and may have a malfunction, you can use this script on demo account. but if you use this script on real account, i will not / i don't take any responsibility if you get loss.
