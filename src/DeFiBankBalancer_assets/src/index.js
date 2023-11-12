import { DeFiBankBalancer } from "../../declarations/DeFiBankBalancer";

window.addEventListener("load", async function () {
  // console.log("Finished loading");
  update();
});

document.querySelector("form").addEventListener("submit", async function (event) {
  event.preventDefault();
  // console.log("Submitted.");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);
  const interestRate = parseFloat(document.getElementById("interest-rate").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
    await DeFiBankBalancer.topUp(inputAmount);
  }

  if (document.getElementById("withdrawal-amount").value.length != 0) {
    await DeFiBankBalancer.withdraw(outputAmount);
  }

  if (document.getElementById("interest-rate").value.length != 0) {
    await DeFiBankBalancer.updateInterestRate(interestRate / 100);
  }

  await DeFiBankBalancer.compoundInterest();

  update()

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  document.getElementById("interest-rate").value = "";

  button.removeAttribute("disabled");

});

async function update() {
  const currentAmount = await DeFiBankBalancer.checkBalance();
  const currentInterestRate = await DeFiBankBalancer.checkInterestRate();
  const estimateBalanceAfterOneYear = await DeFiBankBalancer.estimateBalanceAfterOneYear();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
  document.getElementById("current-interest-rate").innerText = Math.round(currentInterestRate * 10000) / 100;
  document.getElementById("estimate-balance").innerText = Math.round(estimateBalanceAfterOneYear * 100) / 100;
};