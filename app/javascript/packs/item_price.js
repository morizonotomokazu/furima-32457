window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(parseInt(inputValue) - parseInt(addTaxDom.innerHTML));
  })
});