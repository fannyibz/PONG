import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data.message);
        scrollLastMessageIntoView();
        addAuthorClassToLastMessage(data);
      },
    });
  }
}

const scrollLastMessageIntoView = () => {
  const messages = document.querySelectorAll('.message-container');
  const lastMessage = messages[messages.length - 1];
  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}

const addAuthorClassToLastMessage = (data) => {
  const messages = document.querySelectorAll('.message-container');
  const lastMessage = messages[messages.length - 1];
  const userId = document.getElementById('messages').dataset.userId;
  const form = document.getElementById('new_message');

  if (lastMessage !== undefined) {
    if (data.author_id == userId) {
      lastMessage.classList.add("is-author");
      form.reset();
    }
  }
}

export { initChatroomCable };
