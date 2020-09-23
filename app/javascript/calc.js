function calc (){
  
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")

  itemPrice.addEventListener('input', function(){
    const inputPrice = document.getElementById("item-price").value
    value1 = Math.round(inputPrice * 0.1) 
    value2 = Math.round(inputPrice * 0.9)
    addTaxPrice.innerHTML = value1
    Profit.innerHTML = value2
  })
}

window.addEventListener('load', calc)