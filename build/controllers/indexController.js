"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class IndexController {
    index(req, res) {
        res.send({ text: 'API is /api/games' });
    }
}
exports.indexController = new IndexController();
