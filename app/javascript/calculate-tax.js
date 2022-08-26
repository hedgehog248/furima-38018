function taxAndProfit() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.value = Math.trunc(itemPrice.value * 0.1); // 特に指示がなかったため一旦小数点以下は切り捨てに設定
    taxPrice.innerHTML = taxPrice.value;

    const profit = document.getElementById("profit");
    profit.innerHTML = itemPrice.value - taxPrice.value;
  });  
}

window.addEventListener('load', taxAndProfit);