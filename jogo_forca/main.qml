import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Forca 1.0

Item{
    id: variavel
    property int error:0

    Window {
        width: 640
        height: 480
        visible: true
        color: "beige"
        title: qsTr("Jogo da Forca")



        function testa(chute){
            let j = 0
            for(let  i = 0; i < forca.m_palavra.length;  i++){
                if(chute === forca.m_palavra.split('')[i]){
                    j=1
                }
            }
            if(j==1){
                console.log("Chute valido: "+ chute)

            }else{
                console.log("Chute invalido: "+ chute)
                variavel.error +=1
//                if(variavel.error === 1){
//                    erro0.visible = false
//                    erro1.visible = true
//                }else if(variavel.error === 2){
//                    erro1.visible = false
//                    erro2.visible = true
//                }else if(variavel.error === 3){
//                    erro2.visible = false
//                    erro3.visible = true
//                }else if(variavel.error === 4){
//                    erro3.visible = false
//                    erro4.visible = true
//                }else if(variavel.error === 5){
//                    erro4.visible = false
//                    erro5.visible = true
//                }

            }

        }


        Item {
            id: telaPrincipal
            anchors.centerIn: parent
            Column{
                spacing: 5

                Button {
                    id: cadastro
                    text: "Nova palvra"
                    onClicked: {
                        telaPrincipal.visible = false
                        novaPalavra.visible = true
                    }
                }
                Button {
                    id: iniciar
                    text: "Iniciar"
                    onClicked: {
                        telaPrincipal.visible = false
                        jogo.visible = true
                        forca.le_arquivo()
                    }
                }
            }
        }
        Item {
            id: jogo
            visible: false
            anchors.fill: parent

            Button {
                id: voltar2
                text: "Voltar"
                onClicked: {
                    telaPrincipal.visible = true
                    jogo.visible = false
                }
            }
            Text {

                text: qsTr("Chute")
                x: parent.width/10
                y: (parent.height/2)-35
                font.pointSize: 24
            }
            TextInput{
                x: parent.width/10
                y: parent.height/2
                width: 200
                height: 200
                cursorVisible: true
                font.pointSize: 24
                color: "blue"
                text: ""
                onAccepted: {

                    let chute = getText(0,1)
                    //testa(chute)
                    clear()
                }
            }
            Image {
                id: erro
                visible: true
                width: 200
                height: 200
                x: parent.width/2
                y: parent.height/2
                anchors.centerIn: parent
                source:"qrc:/../../untitled3/Imagens/ZeroErros.png"

            }
//            Image {
//                id: erro1
//                visible: false
//                width: 200
//                height: 200
//                x: parent.width/2
//                y: parent.height/2
//                anchors.centerIn: parent
//                source:"qrc:/../../untitled3/Imagens/UmErro.png"

//            }
//            Image {
//                id: erro2
//                visible: false
//                width: 200
//                height: 200
//                x: parent.width/2
//                y: parent.height/2
//                anchors.centerIn: parent
//                source:"qrc:/../../untitled3/Imagens/DoisErro.png"

//            }
//            Image {
//                id: erro3
//                visible: false
//                width: 200
//                height: 200
//                x: parent.width/2
//                y: parent.height/2
//                anchors.centerIn: parent
//                source:"qrc:/../../untitled3/Imagens/TresErros.png"

//            }
//            Image {
//                id: erro4
//                visible: false
//                width: 200
//                height: 200
//                x: parent.width/2
//                y: parent.height/2
//                anchors.centerIn: parent
//                source:"qrc:/../../untitled3/Imagens/QuatroErros.png"

//            }
//            Image {
//                id: erro5
//                visible: false
//                width: 200
//                height: 200
//                x: parent.width/2
//                y: parent.height/2
//                anchors.centerIn: parent
//                source:"qrc:/../../untitled3/Imagens/CincoErros.png"

//            }
            Item {
                id: _This
                property string attemptedLetters: ""
                Item {
                    id: _delegate
                    property string word: forca.m_palavra
                    Row{
                        Repeater{
                            model: _delegate.word.length
                            Rectangle{
                                Text {
                                    id: name
                                    text: _delegate.word[index]
                                    visible: true//_This.attemptedLetters.contains(text)
                                }
                            }
                        }
                    }
                }
            }


            //        Row {
            //            x: parent.width/2
            //            y: parent.height-80
            //            width: 200
            //            height: 200

            //            spacing: 10


            //            Repeater{
            //                model: forca.m_palavra.length

            //                Text {
            //                    font.pointSize: 24
            //                    text: forca.m_palavra.split('')[index]

            //                }

            //            }

            //        }




        }

        Item {
            id: novaPalavra
            visible: false
            anchors.fill: parent
            Text {
                text: "Nova Palavra!"; font.family: "Helvetica"; font.pointSize: 24; color: "black"
            }
            Button {
                id: voltar1
                text: "Voltar"
                onClicked: {
                    telaPrincipal.visible = true
                    novaPalavra.visible = false
                }
            }
        }

    }
}
