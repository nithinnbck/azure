const express = require('express');
const app = express();

// Routes
app.get('/', (req, res) => {
  res.send('Hello from Node.js Docker App!');
});

// Export app for testing
module.exports = app;

// Only start server if not in test  environment
if (process.env.NODE_ENV !== 'test') {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}
