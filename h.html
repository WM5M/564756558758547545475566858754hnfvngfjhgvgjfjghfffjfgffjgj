<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>KOBRA MENU</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background: transparent;
            font-family: 'Arial', sans-serif;
            color: #ffffff;
            user-select: none;
        }

        /* Compact menu container - top-left, fixed size */
        #menu-container {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 520px;
            height: 680px;
            background: rgba(0, 0, 0, 0.92);
            border: 3px solid #ff0000;
            border-radius: 15px;
            box-shadow: 0 0 40px rgba(255, 0, 0, 0.6);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            /* Starts hidden */
            display: none;
        }

        #header {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.5);
            border-bottom: 2px solid #ff0000;
        }

        #logo-text {
            font-size: 42px;
            font-weight: bold;
            text-shadow: 0 0 20px #ff0000, 0 0 40px #ff0000;
            letter-spacing: 4px;
        }

        #banner {
            width: 100%;
            height: auto;
            max-height: 150px;
            object-fit: cover;
            border-bottom: 2px solid #ff0000;
        }

        #breadcrumb {
            padding: 8px 15px;
            font-size: 16px;
            background: rgba(0, 0, 0, 0.6);
            text-align: center;
            min-height: 36px;
        }

        #categories {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 12px;
            padding: 15px;
            background: rgba(0, 0, 0, 0.5);
            border-bottom: 1px solid #ff0000;
        }

        .category {
            padding: 10px 24px;
            background: rgba(255, 0, 0, 0.3);
            border: 2px solid #ff0000;
            border-radius: 8px;
            cursor: pointer;
            font-size: 17px;
            transition: all 0.3s;
        }

        .category:hover, .category.active {
            background: #ff0000;
            box-shadow: 0 0 15px #ff0000;
        }

        #elements {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
            background: rgba(0, 0, 0, 0.4);
        }

        .element {
            width: 90%;
            padding: 16px;
            background: rgba(20, 20, 20, 0.85);
            border: 2px solid #ff0000;
            border-radius: 10px;
            text-align: center;
            font-size: 19px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .element:hover, .element.selected {
            background: rgba(255, 0, 0, 0.4);
            transform: scale(1.03);
            box-shadow: 0 0 25px rgba(255, 0, 0, 0.8);
        }

        /* Scrollbar styling for better look */
        #elements::-webkit-scrollbar {
            width: 8px;
        }

        #elements::-webkit-scrollbar-track {
            background: rgba(0, 0, 0, 0.5);
        }

        #elements::-webkit-scrollbar-thumb {
            background: #ff0000;
            border-radius: 4px;
        }

        /* Keyboard Input - adjusted for compact menu */
        #keyboardContainer {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.95);
            padding: 30px;
            border: 4px solid #ff0000;
            border-radius: 15px;
            width: 90%;
            max-width: 500px;
            z-index: 9999;
            text-align: center;
            box-shadow: 0 0 50px rgba(255, 0, 0, 0.9);
        }

        #keyboardTitle {
            color: #ff0000;
            margin-bottom: 15px;
            font-size: 28px;
            text-shadow: 0 0 12px #ff0000;
        }

        #keyboardInput {
            width: 100%;
            padding: 15px;
            font-size: 24px;
            background: #111;
            color: white;
            border: 3px solid #ff0000;
            border-radius: 10px;
            text-align: center;
            outline: none;
        }

        /* Notifications */
        #notifications {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 10000;
        }

        .notification {
            background: rgba(0, 0, 0, 0.9);
            border: 2px solid #ff0000;
            padding: 12px 20px;
            margin-bottom: 8px;
            border-radius: 8px;
            max-width: 350px;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.7);
        }
    </style>
</head>
<body>
    <div id="menu-container">
        <div id="header">
            <span id="logo-text">KOBRA MENU</span>
        </div>
        <img id="banner" src="https://jaythaagamer.simdif.com/images/th/sd_6935ae44db1fd.png?no_cache=1765129304" alt="Kobra Banner">
        <div id="breadcrumb"></div>
        <div id="categories"></div>
        <div id="elements"></div>
    </div>

    <div id="notifications"></div>

    <div id="keyboardContainer">
        <h2 id="keyboardTitle">Choose Menu Key</h2>
        <input type="text" id="keyboardInput" readonly>
    </div>

    <script src="ui.js"></script>
    <script>
        let currentIndex = 0;
        let elements = [];

        function updateSelection() {
            elements.forEach((el, i) => {
                el.classList.toggle('selected', i === currentIndex);
            });

            // Auto-scroll to selected
            if (elements[currentIndex]) {
                elements[currentIndex].scrollIntoView({
                    behavior: 'smooth',
                    block: 'nearest'
                });
            }
        }

        window.addEventListener('message', function(event) {
            const data = event.data;

            // Handle show/hide
            if (data.action === 'showUI') {
                const container = document.getElementById('menu-container');
                container.style.display = data.visible ? 'flex' : 'none';

                // Force update if elements exist
                if (data.visible && elements.length > 0) {
                    updateSelection();
                }
            }

            // Update elements
            if (data.action === 'updateElements') {
                const container = document.getElementById('elements');
                container.innerHTML = '';

                data.elements.forEach((item, i) => {
                    const div = document.createElement('div');
                    div.className = 'element';

                    let text = item.label || '';
                    if ((item.type === "checkbox" || item.type === "slider-checkbox" || item.type === "scrollable-checkbox") && item.checked !== undefined) {
                        text += "                  " + (item.checked ? "On" : "Off");
                    } else if (item.value !== undefined) {
                        text += "                  " + Number(item.value).toFixed(2);
                    }

                    div.textContent = text;

                    if (i === (data.index || 0)) {
                        div.classList.add('selected');
                    }

                    container.appendChild(div);
                });

                elements = Array.from(document.querySelectorAll('.element'));
                currentIndex = data.index || 0;
                updateSelection();
            }

            // Keyboard input
            if (data.action === 'updateKeyboard') {
                const kb = document.getElementById('keyboardContainer');
                kb.style.display = data.visible ? 'block' : 'none';
                if (data.visible) {
                    document.getElementById('keyboardTitle').innerText = data.title || 'Input';
                    document.getElementById('keyboardInput').value = data.value || '';
                }
            }
        });
    </script>
</body>
</html>
