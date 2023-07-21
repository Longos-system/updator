/*
 * Copyright (C) 2023 LongOS Team.
 *
 * Author:     chang2005 <389574063@qq.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import LongUI 1.0 as LongUI
import Long.Updator 1.0

Item {
    id: control

    ColumnLayout {
        anchors.fill: parent

        LongUI.BusyIndicator {
            width: 32
            height: 32
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            height: LongUI.Units.smallSpacing
        }

        Label {
            text: qsTr("Updating, please wait")
            Layout.alignment: Qt.AlignHCenter
        }

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true

            TextArea {
                id: _textArea
                text: updator.statusDetails
                enabled: false

                background: Item {
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: LongUI.Units.largeSpacing
                        radius: LongUI.Theme.smallRadius
                        color: LongUI.Theme.secondBackgroundColor
                    }
                }

                leftPadding: LongUI.Units.largeSpacing * 2
                rightPadding: LongUI.Units.largeSpacing * 2
                topPadding: LongUI.Units.largeSpacing * 2
                bottomPadding: LongUI.Units.largeSpacing * 2

                // Auto scroll to bottom.
                onTextChanged: {
                    _textArea.cursorPosition = _textArea.text.length - 1
                }
            }
        }
    }
}
