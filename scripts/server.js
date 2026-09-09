#!/usr/bin/env node

const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = process.env.PORT || 3000;

const MIME_TYPES = {
  '.html': 'text/html',
  '.css': 'text/css',
  '.js': 'application/javascript',
  '.json': 'application/json',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon'
};

const server = http.createServer((req, res) => {
  let filePath = req.url === '/' ? '/index.html' : req.url;
  
  // Handle static files from public directory
  const publicDir = path.join(__dirname, '..', 'public');
  const fullPath = path.join(publicDir, filePath);
  
  const ext = path.extname(fullPath).toLowerCase();
  const contentType = MIME_TYPES[ext] || 'text/plain';
  
  fs.readFile(fullPath, (err, content) => {
    if (err) {
      if (err.code === 'ENOENT') {
        // Serve index.html for SPA routing
        fs.readFile(path.join(publicDir, 'index.html'), (err2, content2) => {
          if (err2) {
            res.writeHead(404);
            res.end('File not found');
          } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.end(content2);
          }
        });
      } else {
        res.writeHead(500);
        res.end('Server error');
      }
    } else {
      res.writeHead(200, { 'Content-Type': contentType });
      res.end(content);
    }
  });
});

server.listen(PORT, () => {
  console.log(`🚀 obsession-ai website running at http://localhost:${PORT}`);
  console.log(`📦 Package version: 1.0.0`);
  console.log(`✨ ADHD-friendly coding assistant plugins for all editors`);
});
