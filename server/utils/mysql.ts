import mysql from 'mysql2/promise'
import bluebird from 'bluebird'
import 'dotenv/config'
import type { EventHandler, EventHandlerRequest } from 'h3'
export const defineWrappedResponseHandler = <T extends
EventHandlerRequest, D>(
    handler: EventHandler<T, D>
): EventHandler<T, D> =>
    defineEventHandler<T>(async event => {
        try {
            if (!process.env.MYSQL_USER || !process.env.MYSQL_PASSWORD || !process.env.MYSQL_DATABASE) {
                throw new Error('MySQL environment variables not set')
            }
            const connection = await mysql.createConnection({
                host: process.env.MYSQL_HOST || 'localhost',
                user: process.env.MYSQL_USER,
                password: process.env.MYSQL_PASSWORD,
                database: process.env.MYSQL_DATABASE,
                Promise: bluebird,
            })
            event.context.mysql = connection
            const response = await handler(event)
            event.context.mysql.end()
            return response
        } catch (err) {
            // Error handling
            return { err }
        }
})