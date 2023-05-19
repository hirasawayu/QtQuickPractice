import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml.Models
import QtQuick.Controls 2.0


Window {
    id: window
    width: 500
    height: 500
    color: "lightgreen"
    visible: true
    title: qsTr("Calculation Game")

    Rectangle {
        id: button
        width: 250; height: 200;
        anchors.centerIn: parent
        color: "yellow"
        state: "state1"
        property int sum;


        //calculate screen
        Text {
            id: screen1
            anchors.centerIn: parent
            text: "Calculate"
            color: "green"
            font.pointSize: 24
            visible: false

            MouseArea{
                id: mouseArea1Calculate
                anchors.fill: parent
                onClicked: {
                    if (button.state == "state1" && button.sum <30)
                        button.state = "state2"
                    else if (button.state == "state1" && button.sum >=30){
                        button.state = "state3"
                        window.color = "red"
                    }

                    console.log(button.state + " Clicked")
                }
            }
        }

        //total count screen
        Text {
            id: screen2
            anchors.centerIn: parent
            text: button.sum
            color: "red"
            font.pointSize: 24
            visible: false

            MouseArea{
                id: mouseArea12
                anchors.fill: parent
                onClicked: {
                    if (button.state == "state2"){
                        button.state = "state1"
                    }
                    else
                        button.state = "state2"
                    console.log(button.state + " Clicked")

                }
            }
        }

        //gameover screen
        Rectangle {
            id: animation
            anchors.fill: parent
            width: 500; height: 500;
            visible: false

            MouseArea{
                anchors.fill: parent
                onClicked: {

                    button.state = "state1"
                    window.color = "lightgreen"
                    console.log("Animation Finished")
                }
            }

            Image {
                id: image1
                anchors.fill: parent
                width: 500; height: 500
                source: "https://t4.ftcdn.net/jpg/02/11/54/33/360_F_211543376_kv7x0SwdITkWbqajGzglhcvZV25AsPsS.jpg"
            }
        }

        //variation of status
        states: [
            State {
                name: "state1"
                PropertyChanges {
                    target: screen1
                    visible: true
                }
            },

            State {
                name: "state2"
                PropertyChanges {
                    target: screen2
                    visible: true
                }
            },

            State {
                name: "state3"
                PropertyChanges {
                    target: animation
                    visible: true
                }
            }
        ]
    }



    Column{

        Row{
            //button1
            Rectangle {
                id: button1
                width: 50; height: 50;
                //anchors.centerIn: parent
                color: "black"

                Text {
                    id: text1
                    anchors.centerIn: parent
                    text: "1"
                    color: "white"
                    font.pointSize: 15
                    visible: true

                    MouseArea{
                        id: mouseArea1
                        anchors.fill: parent
                        onClicked: {
                            button.sum += 1
                            console.log(text1.text + " plus, sun " + button.sum)
                        }
                    }
                }
            }

            //button 2
            Rectangle {
                id: button2
                width: 50; height: 50;
                //anchors.centerIn: parent
                color: "black"

                Text {
                    id: text2
                    anchors.centerIn: parent
                    text: "2"
                    color: "white"
                    font.pointSize: 15
                    visible: true

                    MouseArea{
                        id: mouseArea2
                        anchors.fill: parent
                        onClicked: {
                            button.sum += 2
                            console.log(text2.text + " plus, sum " + button.sum)
                        }
                    }
                }
            }

            //button3
            Rectangle {
                id: button3
                width: 50; height: 50;
                //anchors.centerIn: parent
                color: "black"

                Text {
                    id: text3
                    anchors.centerIn: parent
                    text: "3"
                    color: "white"
                    font.pointSize: 15
                    visible: true

                    MouseArea{
                        id: mouseArea3
                        anchors.fill: parent
                        onClicked: {
                            button.sum += 3
                            console.log(text3.text + " plus, sum " + button.sum)
                        }
                    }
                }
            }

            // button 4
            Rectangle {
                id: button4
                width: 50; height: 50;
                //anchors.centerIn: parent
                color: "black"

                Text {
                    id: text4
                    anchors.centerIn: parent
                    text: "4"
                    color: "white"
                    font.pointSize: 15
                    visible: true

                    MouseArea{
                        id: mouseArea4
                        anchors.fill: parent
                        onClicked: {
                            button.sum += 4
                            console.log(text4.text + " plus, sum " + button.sum)
                        }
                    }
                }
            }

            //reset button
            Rectangle {
                id: buttonReset
                width: 100; height: 50;
                //anchors.centerIn: parent
                color: "black"

                Text {
                    id: textReset
                    anchors.centerIn: parent
                    text: "Reset"
                    color: "red"
                    font.pointSize: 15
                    visible: true

                    MouseArea{
                        id: mouseAreaReset
                        anchors.fill: parent
                        onClicked: {
                            button.sum = 0
                            console.log("sum reset")
                        }
                    }
                }
            }
        }

        //TODO Move this item
        Rectangle {
            id: explanationRectangle1
            x: 0
            width: 200; height: 30;
            //anchors.centerIn: parent
            color: "yellow"

            //Explanation Text
            Text{
                id: explanationText
                anchors.centerIn: parent
                text: "Do not go above 30!"
                color: "red"
                font.pointSize: 12
                visible: true
            }


            NumberAnimation on x {
                id: animationOnX
                from: 0; to: 300
                duration: 3000

                onFinished: {
                    if (explanationRectangle1.x == 0) {
                        animationOnX.from = 0
                        animationOnX.to = 300
                    }
                    else{
                        animationOnX.from = 300
                        animationOnX.to = 0
                    }
                    animationOnX.running = true
                }
            }
        }
    }
}


