import { Statement, Lexeme, Expression } from "./modules.js";

/**
 * Implements the <code>&lt;output_statement&gt;</code> nonterminal symbol from the grammar.
 */
class OutputStatement extends Statement {
    /**
     * Creates a new OutputStatement object.
     */
    constructor() {
        super();

        /**
         * @property {Expression} _expression - An expression representing the value to be output.
         * @private
         */
        this.expression = undefined;
    }

    /**
     * Compares the remaining sequence of lexemes with the grammar rule for this nonterminal.
     * @argument lexer {Lexer} - An object containing a sequence of lexemes.
     * @modifies This nonterminal's parse tree.
     * @throws An error if the lexemes do not satisfy the grammar rule.
     * @public
     */
    parse(lexer) {
        // <output_statement> ::= print <open_paren> <expression> <close_paren>

        // Consume the next lexeme.
        let lexeme = lexer.getLexeme();
        
        // Verify the expected token.
        if (!lexeme || !lexeme.checkToken(Lexeme.tokens.print)) {
            throw new Error('Expected "print" instead of "' + lexeme.source + '".');
        }

        // Consume the next lexeme.
        lexeme = lexer.getLexeme();
        
        // Verify the expected token.
        if (!lexeme || !lexeme.checkToken(Lexeme.tokens.open_paren/* TODONE? fix this expected token */)) {
            throw new Error('Expected "(" instead of "' + lexeme.source + '".');
        }

        // Delegate parsing to the expression.
        this.expression = Expression.parse(lexer);

        // Consume the next lexeme.
        lexeme = lexer.getLexeme();
        
        // Verify the expected token.
        if (!lexeme || !lexeme.checkToken(Lexeme.tokens.close_paren)) {
            throw new Error('Expected ")" instead of "' + lexeme.source + '".');
        }
    }

    /**
     * Builds an HTML representation of this program's parse tree.
     * @returns {string} An HTML unordered list representing the parse tree. 
     * @public
     */
    getParseTreeAsHtml() {
        return `
        <li>&lt;output_statement&gt;
            <ul>
                <li>print</li>
                <li>(</li>
                <li>
                    ${this.expression.getParseTreeAsHtml()}
                </li>
                <li>)</li>
            </ul>
        </li>`;
    }

    /**
     * Simulates the effect of this node of the parse tree by executing equivalent JavaScript code.
     * @argument {external:Map} symbolTable - A lookup table of identifiers and their current values.
     * @modifies The symbol table argument.
     * @public
     */
    interpret(symbolTable) {
        // Delegate interpretation to the expression.
        return this.expression.interpret(symbolTable) + '<br>';
        //"/* TODONE? fix this output statement interpretation */" + '<br>';
    }

    /**
     * Translates this nonterminal's parse tree into assembly language.
     * @argument {external:Map} symbolTable - A lookup table of identifiers and their associated memory addresses.
     * @modifies The symbol table argument.
     * @returns {string} Assembly code for this nonterminal's parse tree.
     * @public
     */
    compile(symbolTable) {
        return `
# print(${this.expression.source})
    mov esi, ${this.expression.compile(symbolTable)}
    mov edi, OFFSET FLAT:.LC0
    mov eax, 0
    call    printf`;
    }
}

export { OutputStatement };
