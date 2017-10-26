function enter() {
    var name = document.getElementById("teamName");
    if (name.value.length > 0){
        Lottery.methods.newTeam(name).send({from: web3.eth.defaultAccount});
        name.value = "";
        alert("Team toegevoegd!")
    } else {
        alert("Vul een teamnaam in.")
    }
}

function reset() {
    Lottery.methods.reset().send({from: web3.eth.defaultAccount})
}

function end() {
    Lottery.methods.getNumberTeams().call(function(err, value) {
        document.getElementById("teams").value = value
    })

    Lottery.methods.end().call(function(err, value) {
         document.getElementById("winner").value = value
     })

    //Deze functie hoort een enkele string te returnen maar ik krijg het niet werkend.
    // Lottery.methods.endLottery().call(function(err, value){
    //     console.log(value)
    //     console.log(err)
    // })

    // Deze functie zou informatie van het desbetreffende team op tehalen, ook deze return niet de juiste data.
    // Lottery.methods.getTeam(0).call(function(err, value){
    //     console.log(value)
    //     console.log(err)
    // })
}