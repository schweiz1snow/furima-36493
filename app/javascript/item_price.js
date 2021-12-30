function item_price (){
  const itemPrice  = document.getElementById("item-price")
  itemPrice.addEventListener("input", function(){
    const addTax  = document.getElementById("add-tax-price")
    addTax.innerHTML = itemPrice.value / 10 
    console.log(addTax.innerHTML)

    const profitPrice = document.getElementById("profit")
    profitPrice.innerHTML = itemPrice.value - (itemPrice.value / 10 )
    console.log(profitPrice.innerHTML)

  });
};

window.addEventListener('load', item_price)

