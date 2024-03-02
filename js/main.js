// recuperation des données conteneue dans le binaire webassembly 
const go = new Go();
let index = 0
WebAssembly.instantiateStreaming(fetch("../wasm/operation.wasm"), go.importObject).then((result) => {
   go.run(result.instance);
});

function ajouterSaisie(zone){
   // ajoute dans la zone des saisies une saisie avec un evenement qui verifie si une saisie change de valeur
   const zone_value = id(zone)
   const saisi = document.createElement("input")
   saisi.type ="number"
   saisi.id = "nb" + (++index)
   saisi.value ="0"
   saisi.classList ="border border-3 rounded-md bg-neutral-900 border-green-500 m-4 p-2 "
   saisi.addEventListener("change", ()=>{
      recuperationAllData(zone)
   })
   zone_value.append(saisi)

  
}

function id(selector){
   // recupere un lement avec sont id
   return document.querySelector("#"+selector)
}

function  recuperationAllData(zone){
   // recupere toute les valeurs des saisie
   let data = id(zone)
   let dernier= (data.childElementCount)

   let val = []

   for (let index = 0; index < dernier; index++) {
        val.push(parseInt(id("nb"+index).value))
       
   }
   id('nb').innerText = moyenne(...val) + '/' + add(...val)

}

//evenement ajout a la zone de saisie une saisie identifiable
id("run").addEventListener("click",()=>{
    ajouterSaisie("val")
})

// evenement qui verifie si  la   valeur change dans la premiere saisie
id("nb0").addEventListener("change",()=>{
   recuperationAllData("val")
})