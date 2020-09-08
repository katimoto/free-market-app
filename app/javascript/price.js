function price(){

   const priceInput = document.getElementById("item-price");
   const addTax = document.getElementById("add-tax-price");//販売手数料
   const gainProfit = document.getElementById("profit");//販売利益

     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value;
         
       if (value >= 300 && value <= 9,999,999){
         let fee = value * 0.1
         let gains = value - fee
         addTax.textContent = Math.floor(fee);
         gainProfit.textContent = Math.floor(gains);
     } else {
       let fee = '-';
       let gains = '-';
       addTax.textContent = fee;
       gainProfit.textContent = gains;
     }
   });
  
  }
  window.addEventListener('load', price);