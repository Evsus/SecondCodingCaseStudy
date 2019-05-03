import { Lexeme, IdentifierExpression, NumberExpression } from "./modules.js";

/**
 * Implements the <code>&lt;expression&gt;</code> nonterminal symbol from the grammar.
 * @abstract
 */
class Expression {
    /**
     * Compares the remaining sequence of lexemes with the grammar rule for this nonterminal.
     * @argument lexer {Lexer} - An object containing a sequence of lexemes.
     * @returns {Expression} The root of the parse (sub)tree for this nonterminal.
     * @throws An error if the lexemes do not satisfy the grammar rule.
     * @static
     * @public
     */
    static parse(lexer) {
        // <expression> ::= <identifier> | <number>

        // Preview the next lexeme to determine which kind of expression it starts.
        let lexeme = lexer.getLexeme(false);
        let expression = undefined;

        if (lexeme.checkToken(Lexeme.tokens.identifier)) { /* TODONE?  fix this */
            expression = new IdentifierExpression();
        }
        else if (lexeme.checkToken(Lexeme.tokens.number)) { /* TODONE? fix this */
            expression = new NumberExpression();
        }
        else {
            throw new Error('Expected an expression instead of "' + lexeme.source + '".');
        }

        // Delegate parsing to the expression subclass.
        expression.parse(lexer);

        return expression;
    }
}

export {Expression};
