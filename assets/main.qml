import bb.cascades 1.2
import bb.system 1.2

Page {
    Container {
        layout: DockLayout {
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            topPadding: 40
            Label {
                id: target
                text: "This is a label!"
                verticalAlignment: VerticalAlignment.Top
                textStyle.fontSize: FontSize.Large
            }
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                Button {
                    text: "Delete label"
                    attachedObjects: [
                        SystemToast {
                            id: myQmlToast
                            body: "Label deleted!"
                            button.enabled: true
                            button.label: "Undo"
                            onFinished: {
                                var text = target.text
                                target.setText("")
                                console.log("target text deleted")
                                if (value == SystemUiResult.ButtonSelection) {
                                    //Do nothing
                                    console.log("The user gave up!")
                                    target.setText(text)
                                } else if (value == SystemUiResult.TimeOut) {
                                    //Delete for real!!!
                                    console.log("Deleted!")
                                }
                            }
                        }
                    ]
                    onClicked: {
                        myQmlToast.show()
                    }
                } // end of Button
            } // end of Container
        } // end of inner Container
    } // end of top-level Container
}// end of Page