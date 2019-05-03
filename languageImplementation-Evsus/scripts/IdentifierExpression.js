import { Expression, Lexeme } from "./modules.js";

/**
 * Implements use of the <code>&lt;identifier&gt;</code> nonterminal as an expression in the grammar.
 */
class IdentifierExpression extends Expression {
    /**
     * Creates a new IdentifierExpression.
     */
    constructor() {
        super();

        /**
         * @property {string} source - The source code for this expression.
         * @public
         */
        this.source = undefined;
    }

    /**
     * Compares the remaining sequence of lexemes with the grammar rule for this nonterminal.
     * @argument lexer {Lexer} - An object containing a sequence of lexemes.
     * @modifies This nonterminal's parse tree.
     * @throws An error if the lexemes do not satisfy the grammar rule.
     * @public
     */
    parse(lexer) {
        // Consume the next lexeme.
        let lexeme = lexer.getLexeme();

        // Verify the expected token.
        if (!lexeme || !lexeme.checkToken(Lexeme.tokens.identifier)) {
            throw new Error('Expected an identifier expression instead of "' + lexeme.source + '".');
        }

        // Store the source code for this expression.
        this.source = lexeme.source;
    }

    /**
     * Builds an HTML representation of this program's parse tree.
     * @returns {string} An HTML unordered list representing the parse tree. 
     * @public
     */
    getParseTreeAsHtml() {
        return `&lt;expression&gt;
            <ul>
                <li>&lt;identifier&gt;
                    <ul>
                        <li>
                            ${this.source}
                        </li>
                    </ul>
                </li>
            </ul>`;
    }

    /**
     * Simulates the effect of this node of the parse tree by executing equivalent JavaScript code.
     * @argument {external:Map} symbolTable - A lookup table of identifiers and their current values.
     * @returns {number} The value of this expression (which defaults to zero).
     * @public
     */
    interpret(symbolTable) {
        // Get this expression's value from the symbol table.
        let value = symbolTable.get(this.source); /* TODOne? fix this */

        // Return the value, or zero if no value was found.
        return Number(value || 0);
    }

    /**
     * Translates this nonterminal's parse tree into assembly language.
     * @argument {external:Map} symbolTable - A lookup table of identifiers and their associated memory addresses.
     * @returns {string} Assembly code for this nonterminal's parse tree.
     * @public
     */
    compile(symbolTable) {
        // Get this identifier's associated RAM address from the symbol table.
        let value = symbolTable.get(this.source); //"/* TODONE? fix this */";

        // If the idetifier is not in the symbol table, return zero.
        if (!value) {
            return '0';
        }

        // Return an expression that reads from this identifier's associated address.
        return `DWORD PTR [rbp-${value}]`; // `DWORD PTR [rbp-${value}]` "/* TODO ask about this* fix this identifier expression */";
    }
}

export { IdentifierExpression };
