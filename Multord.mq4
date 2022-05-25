//+------------------------------------------------------------------+
//|                                                      Multord.mq4 |
//|                                       Rafiansyah Dwi Sadyawinata |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
#property show_inputs

enum Action
  {
   buy = OP_BUY,
   sell = OP_SELL,
  };

input bool DelayMode = false;
extern double Lot = 0.01;
extern int Slippage = 0;
extern double SL_Price = 0.0;
extern double TP_Price = 0.0;
input Action Aksi = buy;
extern int Layer = 1;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   int Cmd = Aksi;
   double sl = NormalizeDouble(SL_Price,Digits);
   double tp = NormalizeDouble(TP_Price,Digits);
   double OpenPrice=0;
   int OrderNumber = 0;
   int sucOrder = 0;
   if(!DelayMode)
     {
      if(Cmd==OP_BUY)
        {
         OpenPrice=NormalizeDouble(MarketInfo(Symbol(),MODE_ASK),Digits);
        }
      if(Cmd==OP_SELL)
        {
         OpenPrice=NormalizeDouble(MarketInfo(Symbol(),MODE_BID),Digits);
        }
     }
   for(int i=1; i<=Layer; i++)
     {
     RefreshRates();
      if(DelayMode)
        {
         if(Cmd==OP_BUY)
           {
            OpenPrice=NormalizeDouble(MarketInfo(Symbol(),MODE_ASK),Digits);
           }
         if(Cmd==OP_SELL)
           {
            OpenPrice=NormalizeDouble(MarketInfo(Symbol(),MODE_BID),Digits);
           }
           Sleep(500);
        }
      if(!IsTradeAllowed())
        {
         Sleep(500);
         continue;
        }
      if(IsTradeContextBusy())
        {
         Sleep(500);
         continue;
        }
      sucOrder = OrderSend(Symbol(),Cmd,Lot,OpenPrice,Slippage,sl,tp);
      Sleep(100);
      RefreshRates();
      if(sucOrder > 0)
        {
         OrderNumber += 1;
        }
      else
        {
         continue;
        }
     }
   if(OrderNumber > 0)
     {
      MessageBox(StringConcatenate("Sukses Buka ",OrderNumber," Order ", Symbol(), "\n\n", "BID: ", Bid, "\t\t ASK: ", Ask, "\n SL Price: ", SL_Price, "\t\t TP Price: ", TP_Price));
     }
   else
     {
      MessageBox("GAGAL BUKA ORDER ",StringConcatenate(GetLastError()));
     }
  }
//+------------------------------------------------------------------+
