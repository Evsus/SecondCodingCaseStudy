import { Lexeme, AssignmentStatement, OutputStatement } from "./modules.js";

/**
 * Implements the <code>&lt;statement&gt;</code> nonterminal symbol from the grammar.
 * @abstract
 */
class Statement {
    /**
     * Compares the remaining sequence of lexemes with the grammar rule for this nonterminal.
     * @argument lexer {Lexer} - An object containing a sequence of lexemes.
     * @returns {Statement} The root of the parse (sub)tree for this nonterminal.
     * @throws An error if the lexemes do not satisfy the grammar rule.
     * @static
     * @public
     */
    static parse(lexer) {
        // <statement> ::= <assignment_statement> | <output_statement>

        // Preview the next lexeme to determine which kind of statement it starts.
        let lexeme = lexer.getLexeme(false);
        let statement = undefined;

        if (lexeme.checkToken(Lexeme.tokens.identifier/* TODONE? fix this expected token */)) {
            statement = new AssignmentStatement();
        }
        else if (lexeme.checkToken(Lexeme.tokens.print)) {
            statement = new OutputStatement();
        }
        else {
            throw new Error('Expected a statement instead of "' + lexeme.source + '".');
        }

        // Delegate parsing to the statement subclass.
        statement.parse(lexer);

        return statement;
    }
}

export { Statement };
