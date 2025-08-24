import { useEffect, useState } from "react";
import "./app.css"; // import css file

const App = () => {
  // State to track the socket connection
  const [socket, setSocket] = useState<WebSocket | null>(null);
  const [messages, setMessages] = useState<string[]>([]);
  const [userMessage, setUserMessage] = useState<string>("");

  // Connect to the server
  useEffect(() => {
    const ws = new WebSocket("ws://localhost:4000");
    ws.onopen = () => {
      console.log("Connected to the server");
      setSocket(ws);
    };

    ws.onmessage = (event) => {
      console.log("Received a message from the server");

      // Check if event.data is a Blob and convert it to text
      if (event.data instanceof Blob) {
        const reader = new FileReader();
        reader.onload = () => {
          const text = reader.result as string;
          setMessages((prevMessages) => [...prevMessages, text]);
        };
        reader.readAsText(event.data);
      } else if (typeof event.data === "string") {
        setMessages((prevMessages) => [...prevMessages, event.data]);
      }
    };

    ws.onclose = () => {
      console.log("Disconnected from the server");
      setSocket(null);
    };

    ws.onerror = (err) => {
      console.error(err);
      ws.close();
    };

    return () => {
      ws.close();
    };
  }, []);

  if (!socket) {
    return (
      <div>
        <h1>Connecting to the server...</h1>
      </div>
    );
  }

  return (
    <div className="app-container">
      <h1 className="chat-title">Websocket Chat</h1>
      <div className="chat-box">
        <div className="messages">
          {messages.map((message, index) => (
            <div key={index} className="message">
              {message}
            </div>
          ))}
        </div>
        <div className="input-container">
          <input
            type="text"
            value={userMessage}
            onChange={(e) => setUserMessage(e.target.value)}
            className="input"
            placeholder="Type your message..."
          />
          <button
            onClick={() => {
              socket.send(userMessage);
              setUserMessage("");
            }}
            className="send-button"
          >
            Send
          </button>
        </div>
      </div>
    </div>
  );
};

export default App;
